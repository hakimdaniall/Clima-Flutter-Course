import 'dart:io';

import 'dart:io';

void main() {
  performTasks();
  task4();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 Complete');
}

Future task2() async {
  Duration threeSecs = Duration(seconds: 3);

  String result;
  //sleep(threeSecs);
  await Future.delayed(threeSecs, () {
    result = 'task 2 data';
    print('Task 2 Complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 Complete with $task2Data');
}

void task4() {
  print('Task 4 complete');
}