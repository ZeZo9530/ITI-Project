// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Register.dart';
import 'package:flutter_application_1/TheApp/Layout.dart';
import 'package:flutter_application_1/dio/api_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can't be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      return null;
                    },
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    width: 200,
                    child: MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            print(emailController.text);
                            print(passwordController.text);
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                uid = value.user!.email;
                                print(value.user!.email);
                                print(value.user!.uid);
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Layout(
                                            uids: uid,
                                          ))));
                            } on FirebaseAuthException catch (error) {
                              Fluttertoast.showToast(
                                  msg: error.message!,
                                  gravity: ToastGravity.TOP);
                            }
                            ;
                          }
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          },
                          child: const Text("Register"))
                    ],
                  )
                ]),
              )),
        ));
  }
}
