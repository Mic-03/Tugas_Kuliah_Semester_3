import 'dart:math';
import 'dart:async';
import 'dart:collection';

const int boardHeight = 20;
const int boardWidth = 20;
const String lizardChar = '*';
const String foodChar = '@';
const String emptySpace = ' ';

class Point {
  int x, y;
  Point(this.x, this.y);
  
  bool equals(Point other) => x == other.x && y == other.y;
}

class LizardGame {
  // Using a LinkedList to store the lizard's body
  LinkedList<PointNode> lizardBody = LinkedList<PointNode>();
  late Point food;
  bool gameOver = false;
  
  LizardGame() {
    // Initial lizard shape (5 segments in a vertical + horizontal pattern)
    lizardBody.add(PointNode(Point(10, 5)));
    lizardBody.add(PointNode(Point(10, 6)));
    lizardBody.add(PointNode(Point(10, 7)));
    lizardBody.add(PointNode(Point(11, 6))); // Turn to right
    lizardBody.add(PointNode(Point(12, 6)));
    food = _spawnFood();  // Initialize food after constructing the object
  }
  
  void start() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (gameOver) {
        timer.cancel();
        print('Game Over! Lizard crashed.');
        return;
      }
      _moveLizard();
      _checkCollision();
      _checkFood();
      _render();
    });
  }

  Point _spawnFood() {
    Random rand = Random();
    Point newFood;
    do {
      newFood = Point(rand.nextInt(boardWidth), rand.nextInt(boardHeight));
    } while (_isOccupied(newFood));
    return newFood;
  }

  bool _isOccupied(Point point) {
    for (var segment in lizardBody) {
      if (segment.point.equals(point)) return true;
    }
    return false;
  }
  
  void _moveLizard() {
    // Get the head of the lizard (last element in LinkedList)
    Point head = lizardBody.last.point;
    
    // Move towards the food
    Point newHead;
    if (head.x < food.x) {
      newHead = Point(head.x + 1, head.y);
    } else if (head.x > food.x) {
      newHead = Point(head.x - 1, head.y);
    } else if (head.y < food.y) {
      newHead = Point(head.x, head.y + 1);
    } else {
      newHead = Point(head.x, head.y - 1);
    }
    
    // Add the new head to the LinkedList
    lizardBody.add(PointNode(newHead));
    
    // If not eating food, remove the tail segment (movement effect)
    if (!newHead.equals(food)) {
      lizardBody.remove(lizardBody.first);
    }
  }
  
  void _checkCollision() {
    Point head = lizardBody.last.point;
    
    // Check wall collision
    if (head.x < 0 || head.x >= boardWidth || head.y < 0 || head.y >= boardHeight) {
      gameOver = true;
    }
    
    // Check self collision (loop over all segments except the head)
    var current = lizardBody.first;
    while (current != lizardBody.last) {
      if (head.equals(current.point)) {
        gameOver = true;
      }
      current = current.next!;
    }
  }
  
  void _checkFood() {
    if (lizardBody.last.point.equals(food)) {
      // Eat the food and grow
      food = _spawnFood();
    }
  }
  
  void _render() {
    // Clear the screen
    print('\x1B[2J\x1B[0;0H');

    // Create the board
    List<List<String>> board = List.generate(boardHeight, (_) => List.filled(boardWidth, emptySpace));

    // Place lizard on the board
    for (var segment in lizardBody) {
      board[segment.point.y][segment.point.x] = lizardChar;
    }

    // Place food on the board
    board[food.y][food.x] = foodChar;
    
    // Print the board
    for (var row in board) {
      print(row.join());
    }
    
    print('Lizard length: ${lizardBody.length}');
  }
}

final class PointNode extends LinkedListEntry<PointNode> {
  Point point;
  PointNode(this.point);
}

void main() {
  LizardGame game = LizardGame();
  game.start();
}
