import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:money_transfer/view/signup.dart';

Widget appbar() {
  return Row(
    children: [
      const SizedBox(
        width: 20,
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 196, 196, 196),
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
            child: IconButton(
          onPressed: () {
            Get.to(Signup());
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        )),
      ),
      const SizedBox(
        width: 150,
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 196, 196, 196),
          border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
            child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_active,
            color: Colors.white,
            size: 20,
          ),
        )),
      ),
      const SizedBox(
        width: 10,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          'images/my_image.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
