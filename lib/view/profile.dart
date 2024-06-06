import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:money_transfer/services/database_logic.dart';
import 'package:money_transfer/view/signup.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 100),
            child: FutureBuilder<String?>(
              future: getUsername(), // Adjusted to Future<String?>
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                cleardebitList();
              },
              child: const Text("Debit Data Reset")),
          ElevatedButton(
              onPressed: () {
                clearCreditList();
              },
              child: const Text("Credit Data Reset")),
                    ElevatedButton(
              onPressed: () {
                clearallList();
              },
              child: const Text("All Data Reset")),
          ElevatedButton(
              onPressed: () {
                Get.to(Signup());
              },
              child: const Text("LogOut")),
        ],
      ),
    );
  }
}
