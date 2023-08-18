// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.deepPurple[400],
          centerTitle: true,
          title: const Text(
            "About the app",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Welcome to our To-Do List App!\n\nOur application is designed to help you stay organized and productive by providing a simple and intuitive platform to manage your tasks. With our app, you can easily create, track, and prioritize your to-do items, ensuring nothing falls through the cracks.\n\nWhether you're managing daily errands, work projects, or personal goals, our To-Do List App is here to simplify your life and help you accomplish more. Stay organized, stay focused, and make every day a productive one!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    "Developed by : Ziad Nabil\nContact : ziadnabil@gmail.com"),
              )
            ],
          ),
        ));
  }
}
