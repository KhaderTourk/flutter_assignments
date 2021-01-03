import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/task.dart';

class TaskItem extends StatefulWidget {
  Task task;
  Function function;
  Function deleteFunction;
  TaskItem(this.task, this.function, this.deleteFunction);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
        key: UniqueKey(),
        leading: Container(child: IconButton(icon:Icon(Icons.delete),onPressed: (){

          widget.deleteFunction(widget.task);
          },)),
        title: Text(this.widget.task.taskTitle),
        trailing: Checkbox(
            value: this.widget.task.isCompleted,
            onChanged: (bool value) => widget.function(widget.task)),

    );
  }
}