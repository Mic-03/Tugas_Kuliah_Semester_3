import 'dart:io';
import 'dart:async';

class Node {
  String? data;
  Node? next;
  Node(this.data);
}

Future<void> delay(int ms) async => await Future.delayed(Duration(milliseconds: ms));

void moveTo(int row, int col) => stdout.write('\x1B[${row};${col}H');
void clearScreen() => stdout.write("\x1B[2J\x1B[0;0H");
getScreenSize() => [stdout.terminalColumns, stdout.terminalLines];

// ANSI escape sequence for red color
void setRedText() => stdout.write('\x1B[31m');
void resetTextColor() => stdout.write('\x1B[0m'); // Reset color to default
void setGreenText() => stdout.write('\x1B[32m');

Node insertNode(Node head, Node newNode, [int position = 0]) {
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }
  Node? curr = head;
  for (int i = 1; i < position - 1 && curr!.next != null; i++) curr = curr.next;
  newNode.next = curr!.next;
  curr.next = newNode;
  return head;
}

Node activateLoop(Node head) {
  Node? curr = head;
  while (curr!.next != null) curr = curr.next;
  curr.next = head;
  return head;
}

Node craft() {
  Node head = Node("k");
  for (var c in ["o", "n", "t", "r", "0", "l"]) insertNode(head, Node(c), 0);
  return activateLoop(head);
}

Node? getNext(Node node) => node.next;

void main() async {
  Node head = craft();
  clearScreen();
  Node? node = head;

  // Loop to display name on screen with cursor movement
  for (int j = 1; j <= getScreenSize()[1]; j++) {
    for (int i = (j % 2 == 0 ? getScreenSize()[0] : 1);
         (j % 2 == 0 ? i > 0 : i <= getScreenSize()[0]);
         i += (j % 2 == 0 ? -1 : 1)) {
      moveTo(j, i);
      stdout.write(node!.data);
      node = getNext(node)!;
      await delay(10);
    }
  }

  // After the display, change the text color to red
  setRedText();
  node = head;

  // Display the name again in red
  for (int j = 1; j <= getScreenSize()[1]; j++) {
    for (int i = (j % 2 == 0 ? getScreenSize()[0] : 1);
         (j % 2 == 0 ? i > 0 : i <= getScreenSize()[0]);
         i += (j % 2 == 0 ? -1 : 1)) {
      moveTo(j, i);
      stdout.write(node!.data);
      node = getNext(node)!;
      await delay(10);
    }
  }

  setGreenText();
  node = head;

  // Display the name again in red
  for (int j = 1; j <= getScreenSize()[1]; j++) {
    for (int i = (j % 2 == 0 ? getScreenSize()[0] : 1);
         (j % 2 == 0 ? i > 0 : i <= getScreenSize()[0]);
         i += (j % 2 == 0 ? -1 : 1)) {
      moveTo(j, i);
      stdout.write(node!.data);
      node = getNext(node)!;
      await delay(10);
    }
  }

  // Reset text color to default
  resetTextColor();
}
