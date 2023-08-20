import 'package:flutter/material.dart';
import 'package:flutter_application_1/TheApp/DoneTasks.dart';
import 'package:flutter_application_1/TheApp/InProgress.dart';
import 'package:flutter_application_1/TheApp/ToDoList.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          "Category",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ToDoScreen(),
                    ));
              },
              child: const Text(
                "To-Do",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InProgress(),
                    ));
              },
              child: const Text(
                "In progress",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoneTasks(),
                    ));
              },
              child: const Text(
                "Done",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
