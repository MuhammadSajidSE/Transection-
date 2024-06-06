import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Debitcontroller extends GetxController {
  var debitvalue = 0.obs;
  TextEditingController debitcontroll = TextEditingController();

  void adddebit() {
        int amount = int.parse(debitcontroll.text);
    debitvalue += amount;
  }

  void subdebit() {
        int amount = int.parse(debitcontroll.text);
    debitvalue -= amount;
  }

  @override
  void onClose() {
    debitcontroll.dispose();
    super.onClose();
  }
}
