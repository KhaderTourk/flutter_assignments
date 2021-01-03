import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/models/task.dart';
import 'package:flutter_to_do/ui/widget/task_item.dart';

class CompletedTasks extends StatelessWidget {
  List<Task> list;
  Function function;
  Function deleteFunction;
  CompletedTasks(this.list, this.function, this.deleteFunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return TaskItem(list[index], function, deleteFunction);
            }));
  }
}