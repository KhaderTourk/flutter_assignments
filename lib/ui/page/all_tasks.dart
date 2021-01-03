import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/repositories/repository.dart';
import 'package:flutter_to_do/ui/widget/task_item.dart';

class AllTasks extends StatelessWidget {
  Function function;
  Function delteFunction;
  AllTasks(this.function, this.delteFunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView.builder(
            itemCount: allTasks.length,
            itemBuilder: (context, index) {
              return TaskItem(allTasks[index], function, delteFunction);
            }));
  }
}