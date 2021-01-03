import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/task.dart';
import 'package:flutter_to_do/repositories/app_provider.dart';
import 'package:flutter_to_do/ui/page/home_page.dart';
import 'package:flutter_to_do/ui/page/splash.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(StartClass());
}

class StartClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider(create:(context){
      return Task();
    },
    child : MaterialApp(home: SplashBage()),
    );
  }


}

