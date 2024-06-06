import 'package:flutter/material.dart';
import 'package:money_transfer/services/database_logic.dart';

class Credidata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getcreditList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: const Text('Nothing to display'));
          } else {
            List<dynamic> creditlist = snapshot.data!;
            return ListView.builder(
              itemCount: creditlist.length,
              itemBuilder: (context, index) {
                List<dynamic> creditData = creditlist[index];
                return ListTile(
                  title: Text(creditData[2].toString()),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(creditData[1].toString()),
                      Text(creditData[0].toString()),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
