import 'package:flutter/material.dart';
import 'package:flutter_application_1/BMI/botnavbar/archiveScreen.dart';
import 'package:flutter_application_1/BMI/botnavbar/doneScreen.dart';
import 'package:flutter_application_1/BMI/botnavbar/taskScreen.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const TaskScreen(),
    const DoneScreen(),
    const ArchiveScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Task App",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Task"),
            BottomNavigationBarItem(icon: Icon(Icons.check), label: "Done"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined), label: "Archived"),
          ],
        ));
  }
}
