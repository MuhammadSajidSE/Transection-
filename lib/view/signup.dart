import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_transfer/controller/database_logic.dart';
import 'package:money_transfer/view/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    deleteUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("SignUp"),
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Enter Your Email"),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Enter Password"),
            controller: passwordController,
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> newUser = {
                "email": emailController.text,
                "password": passwordController.text,
              };
              signup(newUser);
            },
            child: const Text("SignUp"),
          ),
          InkWell(
            child: const Text("Already have an account? Please login"),
            onTap: () {
              Get.to(const Login());
            },
          ),
        ],
      ),
    );
  }
}
