import 'package:flutter/material.dart';
import 'package:money_transfer/services/database_logic.dart';

class AllNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notifications'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getnotificationList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nothing to display'));
          } else {
            List<dynamic> debitlist = snapshot.data!;
            return ListView.builder(
              itemCount: debitlist.length,
              itemBuilder: (context, index) {
                List<dynamic> debitData = debitlist[index];

                // Ensure debitData has at least 3 elements to avoid errors
                if (debitData.length >= 3) {
                  return ListTile(
                    title: Text(debitData[0].toString()),
                    subtitle: Row(
                      children: [
                        Text(debitData[1].toString()),
                        Text(debitData[2].toString()),
                      ],
                    ),
                  );
                } else {
                  // Handle case where debitData doesn't have the expected number of elements
                  return ListTile(
                    title: Text('Incomplete data'),
                    subtitle: Text('The data for this entry is incomplete.'),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
