import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_transfer/controller/debitcontroller.dart';
import 'package:money_transfer/services/database_logic.dart';

class DebitView extends StatelessWidget {
  const DebitView({super.key});

  @override
  Widget build(BuildContext context) {
    Debitcontroller debitControll = Get.put(Debitcontroller());
    TextEditingController creditDescriptions = TextEditingController();

    return Scaffold(
      body: GetX<Debitcontroller>(builder: (c) {
        return Column(
          children: [
            Text(c.debitvalue.toString()),
            TextField(
              controller: debitControll.debitcontroll,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      debitControll.adddebit();
                    },
                    child: const Text("+")),
                ElevatedButton(
                    onPressed: () {
                      debitControll.subdebit();
                    },
                    child: const Text("-")),
              ],
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: "Enter credit description"),
              controller: creditDescriptions,
            ),
            ElevatedButton(
                onPressed: () {
                  String description = creditDescriptions.text;
                  debit(c.debitvalue.toString(), description);
                  updatebalanec(c.debitvalue.toInt());
                  updatedebit(c.debitvalue.toInt());
                  Get.snackbar("Note", "Debit has been done",
                      backgroundColor: Color.fromARGB(255, 255, 230, 166),
                      snackPosition: SnackPosition.TOP);
                },
                child: const Text("Debit")),
          ],
        );
      }),
    );
  }
}
