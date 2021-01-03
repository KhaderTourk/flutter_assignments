import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/models/task.dart';
import 'package:flutter_to_do/ui/widget/task_item.dart';

class UnCompletedTasks extends StatelessWidget {
  List<Task> tasks;
  Function function;
  Function deleteFunction;
  UnCompletedTasks(this.tasks, this.function, this.deleteFunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(tasks[index], function, deleteFunction);
            }));
  }
}