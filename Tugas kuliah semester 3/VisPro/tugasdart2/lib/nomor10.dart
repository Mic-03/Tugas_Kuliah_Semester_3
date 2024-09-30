import 'dart:collection';

void main() {

  Queue<String> queue = Queue<String>();

  queue.addAll(['Nasabah A', 'Nasabah B', 'Nasabah C', 'Nasabah D', 'Nasabah E']);

  int loket1 = 1;
  int loket2 = 2;

  int loketTurn = loket1;
  
  while (queue.isNotEmpty) {
    String nasabah = queue.removeFirst();
    if (loketTurn == loket1) {
      print('$nasabah dilayani di Loket 1');
      loketTurn = loket2;
    } else {
      print('$nasabah dilayani di Loket 2');
      loketTurn = loket1;
    }
  }
}
