import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:money_transfer/services/database_logic.dart';
import 'package:money_transfer/view/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    deleteUsername();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    // Load any initial data if needed
  }

  Future<void> deleteUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loginusername');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Login"),
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Enter Your Email"),
            controller: email,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Enter Password"),
            controller: password,
            obscureText: true,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Enter Name"),
            controller: name,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> newUser = {
                "email": email.text,
                "password": password.text,
              };
              loginfunction(newUser, name.text);
            },
            child: const Text("Login"),
          ),
          InkWell(
            child: const Text("Don't have an account? Sign up"),
            onTap: () {
              Get.to(const Signup());
            },
          ),
        ],
      ),
    );
  }
}
