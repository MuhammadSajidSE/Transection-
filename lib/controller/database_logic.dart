import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:money_transfer/view/first_start.dart';
import 'package:money_transfer/view/login.dart';
import 'package:money_transfer/view/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void navigateToHome() async {
  await Future.delayed(const Duration(seconds: 1), () {});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userListJson = prefs.getString('loginusername');
  if (userListJson != null) {
    Get.to(HomeScreen());
    {}
  } else {
    Get.to(const Signup());
  }
}

Future<List<Map<String, String>>> getUserList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userListJson = prefs.getString('userList');
  if (userListJson != null) {
    List<dynamic> userListDynamic = jsonDecode(userListJson);
    List<Map<String, String>> userList = userListDynamic
        .map((item) => Map<String, String>.from(item))
        .toList();
    return userList;
  } else {
    return [];
  }
}


  Future<void> loginfunction(Map<String, String> newUser, String text) async {
    List userList = await getUserList();
    bool emailExists = userList.any((user) =>
        user['email'] == newUser['email'] &&
        user['password'] == newUser['password']);
    if (emailExists) {
      await logindone(text);
      print('\n\n\n\n\n\n\n\n\n');
      print("Login Successfully");
      Get.to(HomeScreen()); // Ensure HomeScreen is properly implemented
    } else {
      print('\n\n\n\n\n\n\n\n\n');
      print('email or password incorrect');
    }
  }
  Future<void> logindone(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginusername', name);
  }

Future<void> storeUserList(List<Map<String, String>> userList) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userListJson = jsonEncode(userList);
  await prefs.setString('userList', userListJson);
}

Future<void> signup(Map<String, String> newUser) async {
  List<Map<String, String>> userList = await getUserList();
  bool emailExists = userList.any((user) => user['email'] == newUser['email']);
  if (emailExists) {
    print('The email ${newUser['email']} already exists.');
  } else {
    userList.add(newUser);
    await storeUserList(userList);
    print('User added successfully.');
    Get.to(const Login());
  }
}

Future<String?> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('loginusername');
  print('\n\n\n\n\n\n\n\n\n');
  print(username);
  return username;
}

Future<void> deleteUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('loginusername');
}
