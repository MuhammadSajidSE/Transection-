import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_transfer/services/database_logic.dart';
import 'package:money_transfer/view/credit_notification.dart';
import 'package:money_transfer/view/debit_notification.dart';
import 'package:money_transfer/widget/add_card.dart';
import 'package:money_transfer/widget/app_bar.dart';
import 'package:money_transfer/widget/cards.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 0, 0, 0)
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 35),
            appbar(),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(right: 180),
              child: const Text(
                "Good Morning",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 100),
              child: FutureBuilder<String?>(
                future: getUsername(),
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
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 15),
                FutureBuilder<int>(
                  future: gettotalbalanec(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else {
                      int totalCredit = snapshot.data ?? 0;
                      return FutureBuilder<double>(
                        future: getLasttransefer(),
                        builder: (context, lastCreditSnapshot) {
                          if (lastCreditSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (lastCreditSnapshot.hasError) {
                            return const Text("Error");
                          } else {
                            double lastCreditAmount =
                                lastCreditSnapshot.data ?? 0.0;
                            return cards(
                              totalCredit,
                              lastCreditAmount,
                              "+",
                              Colors.grey,
                              const Color.fromARGB(255, 36, 36, 36),
                              Colors.black,
                              Colors.white,
                              const Color.fromARGB(255, 66, 66, 66),
                              "Balance",
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(width: 10),
InkWell(
  child: FutureBuilder<int>(
    future: gettotaldebit(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return const Text("Error");
      } else {
        int totalDebit = snapshot.data ?? 0;
        return FutureBuilder<double>(
          future: getLastDebitAmount(),
          builder: (context, lastDebitSnapshot) {
            if (lastDebitSnapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (lastDebitSnapshot.hasError) {
              return const Text("Error");
            } else {
              double lastDebitAmount = lastDebitSnapshot.data ?? 0.0;
              return cards(
                totalDebit,
                lastDebitAmount,
                "+",
                Colors.green,
                const Color.fromARGB(255, 120, 120, 120),
                Colors.white,
                const Color.fromARGB(46, 230, 230, 230),
                Colors.transparent,
                "Income",
              );
            }
          },
        );
      }
    },
  ),
  onTap: () {
    Get.to(Debitdata());
  },
),

              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 15),
                InkWell(
                  child: FutureBuilder<int>(
                    future: gettotalcredit(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                        int totalCredit = snapshot.data ?? 0;
                        return FutureBuilder<double>(
                          future: getLastCreditAmount(),
                          builder: (context, lastCreditSnapshot) {
                            if (lastCreditSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (lastCreditSnapshot.hasError) {
                              return const Text("Error");
                            } else {
                              double lastCreditAmount =
                                  lastCreditSnapshot.data ?? 0.0;
                              return cards(
                                totalCredit,
                                lastCreditAmount,
                                "-",
                                Colors.red,
                                const Color.fromARGB(255, 120, 120, 120),
                                Colors.white,
                                const Color.fromARGB(46, 230, 230, 230),
                                Colors.transparent,
                                "Expense",
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                  onTap: () {
                    Get.to(Credidata());
                  },
                ),
                const SizedBox(width: 10),
                addcards(
                  const Color.fromARGB(255, 120, 120, 120),
                  Colors.white,
                  const Color.fromARGB(255, 128, 128, 128),
                  Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



                        // Colors.grey,
                        // const Color.fromARGB(255, 36, 36, 36),
                        // Colors.black,
                        // Colors.white,
                        // const Color.fromARGB(255, 66, 66, 66),
                        // "Balance",