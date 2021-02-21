import 'package:flutter/material.dart';
import 'package:todoy_app/Screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'Modals/Task_data.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
       create:(context){
        return TaskData();
       },
            child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Homescreen(),),
     );

  }
}
