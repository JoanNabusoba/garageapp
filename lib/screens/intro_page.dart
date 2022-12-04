import 'package:flutter/material.dart';
import 'package:garage/screens/sign_in.dart';
import 'package:garage/screens/sign_up.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        //bg image
        decoration: BoxDecoration(),
        child: Column(
          children: [
            //Title text
            Text(
              "Shop Name",
            ),
            //Space
            SizedBox(
              height: Get.height * .1,
            ),

            //Buttons
            ElevatedButton(
              onPressed: () async {
                Get.to(() => SignIn());
              },
              child: const Text("Login"),
            ),
            SizedBox(
              height: Get.height * .1,
            ),
            ElevatedButton(
              onPressed: () async {
                Get.to(() => SignUp());
              },
              child: const Text("SignUp"),
            ),
            SizedBox(
              height: Get.height * .1,
            ),
          ],
        ),
      ),
    );
  }
}
