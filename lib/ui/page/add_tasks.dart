import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/task.dart';
import 'package:flutter_to_do/repositories/db_helper.dart';
import 'package:flutter_to_do/repositories/repository.dart';

import 'home_page.dart';

class AddTasksPage extends StatefulWidget {
  @override
  _AddTasksPageState createState() => _AddTasksPageState();
}

class _AddTasksPageState extends State<AddTasksPage> {
  String taskTitle;
  bool isComplete = false;

  addTask() {
    if (taskTitle != null) {
      Task task = Task(taskTitle: this.taskTitle, isCompleted: this.isComplete);
      DBHelper.dbHelper.insertNewTask(task);
      allTasks.add(task);
    }
  }
  @override
  initState() {
    super.initState();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('add task')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          ListTile(
              title: TextField(
                onChanged: (value) {
                  this.taskTitle = value;
                },
              ),
              trailing: Checkbox(
                onChanged: (value) {
                  this.isComplete = value;
                  setState(() {
                  });
                },
                value: false,
              )

          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      addTask();

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }), (route) => false);
                    },
                  ),
                  RaisedButton(
                    child: Text('Back'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
