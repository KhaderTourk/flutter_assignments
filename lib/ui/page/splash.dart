import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do/repositories/db_helper.dart';
import 'package:flutter_to_do/repositories/repository.dart';

import 'home_page.dart';

class SplashBage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DBHelper.dbHelper.returnAllTasks().then((value) => {

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      value.forEach((element) {
        print('element element element : ${element.taskTitle}');
        allTasks.add(element);
      });
      return HomePage();
    }))
    });
    return Scaffold(body: Center(child: CircularProgressIndicator(),),);

    }
  }

