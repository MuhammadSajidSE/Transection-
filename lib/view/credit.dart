import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_transfer/controller/creditcontroller.dart';
import 'package:money_transfer/services/database_logic.dart';

class CreditView extends StatelessWidget {
  const CreditView({super.key});

  @override
  Widget build(BuildContext context) {
    CreditController creditController = Get.put(CreditController());
    TextEditingController creditDescription = TextEditingController();
    return Scaffold(
      body: GetX<CreditController>(builder: (c) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(c.creditValue.toString()),
            TextField(
              controller: creditController.creditControl,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      creditController.addCredit();
                    },
                    child: const Text("+")),
                ElevatedButton(
                    onPressed: () {
                      creditController.subCredit();
                    },
                    child: const Text("-")),
              ],
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: "Enter credit description"),
              controller: creditDescription,
            ),
            ElevatedButton(
                onPressed: () async {
                  int balance = await gettotalbalanec();
                  if (balance - c.creditValue.toInt() < 0) {
                    Get.snackbar("Alert", "Balance is not sufficient",
                        backgroundColor: Color.fromARGB(255, 255, 174, 166),
                        snackPosition: SnackPosition.TOP);
                  } else {
                    await credit(
                        c.creditValue.toString(), creditDescription.text);
                    int value = -1 * (c.creditValue.toInt());
                    await updatebalanec(value);
                    await updatecredit(c.creditValue.toInt());
                    Get.snackbar("Note", "Credit has been done",
                        backgroundColor: Color.fromARGB(255, 255, 230, 166),
                        snackPosition: SnackPosition.TOP);
                  }
                },
                child: const Text("Credit"))
          ],
        );
      }),
    );
  }
}
