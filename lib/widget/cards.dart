import 'package:flutter/material.dart';
Widget cards(double amount, double lastamount, String sign, Color lastamountclr,
    Color cardcolor, Color iconcolor, Color circlecolor, Color borderColor, String cardtext) {
  return Container(
    decoration: BoxDecoration(
      color: cardcolor,
      border: Border.all(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Card(
      color: cardcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0, // To avoid double shadow effect from both Container and Card
      child: Container(
        width: 150,
        height: 132,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$$amount",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white, // Set a visible color for the text
                      ),
                    ),
                    Text(
                      "$sign$lastamount",
                      style: TextStyle(
                        color: lastamountclr,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ), // Use the dynamic color
                    ),
                  ],
                ),
                const SizedBox(width: 18),
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: circlecolor,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_outward,
                        color: iconcolor,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text("$cardtext",style: const TextStyle(fontWeight:FontWeight.w500,fontSize: 18,color: Colors.white)),)
          ],
        ),
      ),
    ),
  );
}
