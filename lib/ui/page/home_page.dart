import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/task.dart';
import 'package:flutter_to_do/repositories/db_helper.dart';
import 'package:flutter_to_do/repositories/repository.dart';
import 'package:flutter_to_do/ui/page/un_completed_tasks.dart';
import 'add_tasks.dart';
import 'all_tasks.dart';
import 'completed_tasks.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setState(() {});
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      DBHelper.dbHelper.deleteTasks();
      allTasks.forEach((element) {
        DBHelper.dbHelper.insertNewTask(element);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  changeTaskComplete(Task task) {
    setState(() {
      int taskIndex =  allTasks.indexOf(task);
      allTasks[taskIndex].toggleTask();
    });
  }

  removeTask(Task task) {
    setState(() {
      int taskIndex = allTasks.indexOf(task);
      allTasks.removeAt(taskIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {return AddTasksPage();
              }), (route) => false);

            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text('TODO'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'AllTasks',
                icon: Icon(Icons.menu),
              ),
              Tab(
                text: 'CompletedTasks',
                icon: Icon(Icons.done),
              ),
              Tab(
                text: 'InCompletedTasks',
                icon: Icon(Icons.close),
              ),
            ]),
          ),
          body: TabBarView(
              children: [
            AllTasks(changeTaskComplete, removeTask),
            CompletedTasks(
                allTasks
                    .where((element) => element.isCompleted == true)
                    .toList(),
                changeTaskComplete,
                removeTask),
            UnCompletedTasks(
                allTasks
                    .where((element) => element.isCompleted == false)
                    .toList(),
                changeTaskComplete,
                removeTask)
          ]),
        ));
  }
}
