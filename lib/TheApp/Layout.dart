import 'package:flutter/material.dart';
import 'package:flutter_application_1/TheApp/ToDoList.dart';
import 'package:flutter_application_1/UserProfile.dart';

import 'About.dart';

class Layout extends StatefulWidget {
  const Layout({super.key, required this.uids});
  final String? uids;
  @override
  State<Layout> createState() => _LayoutState(uids: uids);
}

class _LayoutState extends State<Layout> {
  _LayoutState({required this.uids});
  String? uids;
  int currentIndex = 1;
  late List<Widget> screens = [
    const AboutPage(),
    const ToDoScreen(),
    UserProfile(uid: uids)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration_outlined), label: "About"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "ToDO"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Profile"),
          ],
        ));
  }
}
