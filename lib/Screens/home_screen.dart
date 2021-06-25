import 'package:flutter/material.dart';
import 'package:to_do_list/Widgets/completed_list.dart';
import 'package:to_do_list/Widgets/todo_list.dart';
import 'package:to_do_list/main.dart';
import './/Widgets/add_toDo_Dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoList(),
      CompletedList(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.toc),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 30,
              ),
              label: 'Completed'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddtoDoDialog(),
          barrierDismissible: true,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
