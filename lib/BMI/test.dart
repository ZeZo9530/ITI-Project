import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            leading: const Icon(Icons.menu),
            title: const Text("Test App"),
            centerTitle: true,
            actions: const [Icon(Icons.star)]),
        body: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 223, 110, 243),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.lightGreenAccent,
                  child: const Text(
                    "one",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.orangeAccent,
                  child: const Text(
                    "two",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 247, 50, 116),
                  child: const Text(
                    "three",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.cyan,
                  child: const Text(
                    "four",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
        ));
  }
}
