// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/TheApp/Categories.dart';
import 'package:flutter_application_1/TheApp/DoneTasks.dart';
import 'package:flutter_application_1/TheApp/ToDoList.dart';
import 'package:flutter_application_1/UserProfile.dart';

import 'About.dart';

class Layout extends StatefulWidget {
  const Layout({
    super.key,
    required this.uids,
  });
  final String? uids;

  @override
  // ignore: no_logic_in_create_state
  State<Layout> createState() => _LayoutState(
        uids: uids,
      );
}

class _LayoutState extends State<Layout> {
  _LayoutState({
    required this.uids,
  });
  String? uids;

  int currentIndex = 2;
  late List<Widget> screens = [
    const AboutPage(),
    const Categories(),
    const ToDoScreen(),
    UserProfile(uid: uids)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.app_registration_outlined,
                color: Colors.black,
              ),
              label: "About",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: "cat"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "ToDO"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Profile"),
          ],
        ));
  }
}
