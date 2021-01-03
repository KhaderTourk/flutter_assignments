import 'package:flutter/cupertino.dart';

import 'db_helper.dart';

class AppProvider extends ChangeNotifier{
  String taskTitle;
  bool isCompleted;

AppProvider({this.isCompleted,this.taskTitle});

  toggleTask(){
    this.isCompleted = !this.isCompleted;
    notifyListeners();
  }
AppProvider.fromJson(Map map){
    this.taskTitle = map[DBHelper.taskNameColumnName];
    this.isCompleted = map[DBHelper.taskIsCompletedColumnName] == 1 ? true : false;
  }
  toJson(){
    return{
      DBHelper.taskNameColumnName: this.taskTitle,
      DBHelper.taskIsCompletedColumnName:this.isCompleted?1:0
    };
  }

}