import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:money_transfer/view/credit.dart';
import 'package:money_transfer/view/debit.dart';

class transection extends StatefulWidget {
  const transection({super.key});

  @override
  State<transection> createState() => _transectionState();
}

class _transectionState extends State<transection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(DebitView());
              },
              child: Text("Debit")),
          ElevatedButton(
              onPressed: () {
                Get.to(CreditView());
              },
              child: Text("Credit")),
        ],
      )),
    );
  }
}
