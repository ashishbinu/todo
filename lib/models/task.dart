import 'dart:math';

class Task {
  int id;
  final String title;
  DateTime time;
  bool isDone = false;

  Task(this.title) {
    this.time = DateTime.now();
    this.id = Random().nextInt(1000);
  }

  void save() {
    print('saving into database');
  }
}
