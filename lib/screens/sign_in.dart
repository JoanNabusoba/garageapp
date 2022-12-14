import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:garage/controllers/auth_controller.dart';
import 'package:garage/screens/sign_up.dart';
import 'package:garage/utils/utils.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Email"),
              controller: _emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Password"),
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () async {
                if (_emailController.text.trim().isEmpty ||
                    !_emailController.text.trim().isEmail) {
                  Utils.showError("Please Enter valid email!");
                } else if (_passwordController.text.trim().isEmpty) {
                  Utils.showError("No field should be empty!");
                } else {
                  await AuthController.to.login(_emailController.text.trim(),
                      _passwordController.text.trim());
                }
              },
              child: const Text("Sign In"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
                // ignore: prefer_const_literals_to_create_immutables
                TextSpan(
                    text: 'Don\'t have an account? ',
                    children: <InlineSpan>[
                  TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => SignUp());
                        })
                ])),
          ],
        ),
      ),
    );
  }
}
