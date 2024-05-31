import 'package:flutter/material.dart';

Widget addcards(
    Color cardcolor, Color iconcolor, Color circlecolor, Color borderColor) {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 34,
            ),
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: circlecolor,
                    border: Border.all(color: Color.fromARGB(255, 225, 225, 225)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: iconcolor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
