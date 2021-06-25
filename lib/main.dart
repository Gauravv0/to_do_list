import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Provider/todos.dart';
import './Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'To-Do App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ToDosProvider(),
        child: MaterialApp(
          title: title,
          theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              scaffoldBackgroundColor: Color(0xFFf6f5ee)),
          home: HomeScreen(),
        ),
      );
}
