import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/FireStore.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.uid});
  final String? uid;
  @override
  State<UserProfile> createState() => _UserProfileState(uid: uid);
}

class _UserProfileState extends State<UserProfile> {
  _UserProfileState({required this.uid});
  String? uid;
  UserFireStore? user;
  bool isLoading = true;

  readUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) => user = UserFireStore.fromJson(value.data()!));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    readUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        leading: Builder(builder: (BuildContext context) {
          return const Icon(
            Icons.account_circle,
            size: 35,
            color: Colors.white,
          );
        }),
        backgroundColor: Colors.deepPurple[400],
        title: Text(
          "Weclome ${user?.name}",
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Name : ${user?.name}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Text("Age : ${user?.age}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600)),
                    Text("Phone : ${user?.phone}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
      ),
    );
  }
}
