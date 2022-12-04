// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:garage/controllers/auth_controller.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"), actions: [
        IconButton(
            onPressed: () async {
              await AuthController.to.signOut();
            },
            icon: Icon(Icons.logout))
      ]),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Obx(
              () => Text(
                  "Hello , ${AuthController.to.firebaseUserData.value['name'] ?? 'Stranger'}"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Welcome to the Garage App!")
          ],
        ),
      )),
    );
  }
}
