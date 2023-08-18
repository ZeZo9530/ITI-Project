// ignore_for_file: file_names, camel_case_types, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/TheApp/Layout.dart';
import 'package:flutter_application_1/models/FireStore.dart';

import 'UserProfile.dart';

class createUser extends StatefulWidget {
  createUser({super.key, this.uidz});
  final String? uidz;
  @override
  State<createUser> createState() => _createUserState(uidz: uidz);
}

class _createUserState extends State<createUser> {
  _createUserState({this.uidz});
  String? uidz;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Create Your Profile",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Age",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Phone",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () async {
                final String Name = nameController.text;
                final String Age = ageController.text;
                final String Phone = phoneController.text;
                final docUser =
                    FirebaseFirestore.instance.collection("users").doc(uidz);
                final UserFireStore user =
                    UserFireStore(name: Name, age: Age, phone: Phone);
                final json = user.toJson();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Layout(uids: uidz),
                    ));
                await docUser.set(json);
              },
              icon: const Icon(Icons.add))
        ]),
      ),
    );
  }
}
