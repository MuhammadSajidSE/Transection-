import 'package:flutter/material.dart';
import 'package:money_transfer/controller/database_logic.dart';
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
              const SizedBox(
                height: 35,
              ),
              appbar(),
              const SizedBox(
                height: 50,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 180),
                  child: const Text(
                    "Good Morning",
                    style: const TextStyle(color: Colors.white, fontSize: 23),
                  )),
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

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  cards(
                      200,
                      100,
                      "+",
                      Colors.grey,
                      const Color.fromARGB(255, 36, 36, 36),
                      Colors.black,
                      Colors.white,
                      const Color.fromARGB(255, 66, 66, 66),
                      "Balance"),
                  const SizedBox(
                    width: 10,
                  ),
                  cards(
                      200,
                      100,
                      "+",
                      Colors.green,
                      const Color.fromARGB(255, 120, 120, 120),
                      Colors.white,
                      const Color.fromARGB(46, 230, 230, 230),
                      Colors.transparent,
                      "Income"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  cards(
                      200,
                      800,
                      "-",
                      Colors.red,
                      const Color.fromARGB(255, 120, 120, 120),
                      Colors.white,
                      const Color.fromARGB(46, 230, 230, 230),
                      Colors.transparent,
                      "Expense"),
                  const SizedBox(
                    width: 10,
                  ),
                  addcards(
                      const Color.fromARGB(255, 120, 120, 120),
                      Colors.white,
                      const Color.fromARGB(255, 128, 128, 128),
                      Colors.transparent),
                ],
              ),
            ],
          )),
    );
  }
}
