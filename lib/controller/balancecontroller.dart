import 'package:flutter/material.dart';
import 'package:get/get.dart';

class balancetroller extends GetxController {
  var countValue = 0.obs;
  TextEditingController balanceAmount = TextEditingController();
  void addOne() {
    int balance = int.tryParse(balanceAmount.text) ?? 0;
    countValue.value += balance;
  }

  void subOne() {
    int balance = int.tryParse(balanceAmount.text) ?? 0;
    countValue.value -= balance;
  }

  void balanceHistory() {
    int balance = int.tryParse(balanceAmount.text) ?? 0;
    countValue.value += balance;
  }
}