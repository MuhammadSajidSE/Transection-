import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreditController extends GetxController {
  var creditValue = 0.obs;
  TextEditingController creditControl = TextEditingController();

  void addCredit() {
    int amount = int.parse(creditControl.text);
    creditValue += amount;
  }

  void subCredit() {
    int amount = int.parse(creditControl.text);
    creditValue -= amount;
  }
}
