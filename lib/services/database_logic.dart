import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
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
  } else {
    Get.to(const Signup());
  }
}

Future<List<Map<String, String>>> getUserList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userListJson = prefs.getString('userList');
  if (userListJson != null) {
    List<dynamic> userListDynamic = jsonDecode(userListJson);
    List<Map<String, String>> userList =
        userListDynamic.map((item) => Map<String, String>.from(item)).toList();
    return userList;
  } else {
    return [];
  }
}

Future<void> loginfunction(Map<String, String> newUser, String text) async {
  List<Map<String, String>> userList = await getUserList();
  bool emailExists = userList.any((user) =>
      user['email'] == newUser['email'] &&
      user['password'] == newUser['password']);
  if (emailExists) {
    await logindone(text);
    await allusername(text);
    print("Login Successfully");
    Get.to(HomeScreen());
  } else {
    print('Email or password incorrect');
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
  return prefs.getString('loginusername');
}

Future<void> deleteUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('loginusername');
}

Future<void> allusername(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('allusers', name);
}

Future<List<dynamic>> getDebitList() async {
  String? username = await getUsername();
  if (username == null) return [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = '${username}debitList';
  String? userListJson = prefs.getString(key);
  if (userListJson != null) {
    return jsonDecode(userListJson);
  } else {
    List<dynamic> initialList = [];
    await prefs.setString(key, jsonEncode(initialList));
    return initialList;
  }
}

Future<void> debit(String amount, String description) async {
  String? username = await getUsername();
  if (username == null) return;
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  var newDebitData = [amount, formattedDate, description];
  String key = '${username}debitList';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<dynamic> debitsList = await getDebitList();
  debitsList.add(newDebitData);
  await prefs.setString(key, jsonEncode(debitsList));
  var notificationdata = [amount, formattedDate, "Debit"];
  await setnotification(notificationdata);

}

Future<List<dynamic>> getnotificationList() async {
  String? username = await getUsername();
  if (username == null) return [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = '${username}notification';
  String? userListJson = prefs.getString(key);
  if (userListJson != null) {
    return jsonDecode(userListJson);
  } else {
    List<dynamic> notificationList = [];
    await prefs.setString(key, jsonEncode(notificationList));
    return notificationList;
  }
}

Future<void> setnotification(List data) async {
  String? username = await getUsername();
  if (username == null) return;
  String key = '${username}notification';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<dynamic> notificationList = await getnotificationList();
  notificationList.add(data);
  await prefs.setString(key, jsonEncode(notificationList));
  print(await getnotificationList());
}

Future<List<dynamic>> getcreditList() async {
  String? username = await getUsername();
  if (username == null) return [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = '${username}creditList';
  String? userListJson = prefs.getString(key);
  if (userListJson != null) {
    return jsonDecode(userListJson);
  } else {
    List<dynamic> initialList = [];
    await prefs.setString(key, jsonEncode(initialList));
    return initialList;
  }
}

Future<void> credit(String amount, String description) async {
  String? username = await getUsername();
  if (username == null) return;
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  var newCreditData = [amount, formattedDate, description];
  String key = '${username}creditList';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<dynamic> creditList = await getcreditList();
  creditList.add(newCreditData);
  await prefs.setString(key, jsonEncode(creditList));
  print(await getcreditList());
  var notificationdata = [amount, formattedDate, "Credit"];
  await setnotification(notificationdata);
}

Future<void> clearCreditList() async {
  String? username = await getUsername();
  if (username == null) return;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = '${username}creditList';
  await prefs.remove(key);
}

Future<void> cleardebitList() async {
  String? username = await getUsername();
  if (username == null) return;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = '${username}debitList';
  await prefs.remove(key);
}

Future<void> clearallList() async {
  String? username = await getUsername();
  if (username == null) return;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = '${username}notification';
  await prefs.remove(key);
}

Future<void> updatebalanec(int amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = await getUsername();
  String key = '${username}totalbalance';
  int currentBalance = prefs.getInt(key) ?? 0;
  int newBalance = currentBalance + amount;
  await prefs.setInt(key, newBalance); 
}

Future<int> gettotalbalanec() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = await getUsername();
  String key = '${username}totalbalance';
  int currentBalance = prefs.getInt(key) ?? 0;
  return currentBalance;
}

Future<void> updatedebit(int amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = await getUsername();
  String key = '${username}totaldebit';
  int currentdebit = prefs.getInt(key) ?? 0;
  int newdebit = currentdebit + amount;
  await prefs.setInt(key, newdebit);
}

Future<void> updatecredit(int amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = await getUsername();
  String key = '${username}totalcredit';
  int currentcredit = prefs.getInt(key) ?? 0;
  int newcredit = currentcredit + amount;
  await prefs.setInt(key, newcredit);
}

Future<int> gettotaldebit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = await getUsername();
  String key = '${username}totaldebit';
  int currentdebit = prefs.getInt(key) ?? 0;
  return currentdebit;
}

Future<int> gettotalcredit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = await getUsername();
  String key = '${username}totalcredit';
  int currentdebit = prefs.getInt(key) ?? 0;
  return currentdebit;
}

Future<double> getLastCreditAmount() async {
  List<dynamic> creditList = await getcreditList();
  if (creditList.isNotEmpty) {
    return double.parse(creditList.last[0].toString());
  } else {
    return 0.0; // or return a default value if needed
  }
}

Future<double> getLastDebitAmount() async {
  List<dynamic> debitList = await getDebitList();
  if (debitList.isNotEmpty) {
    // Assuming the amount is stored as a string, parse it to double
    return double.parse(debitList.last[0].toString());
  } else {
    return 0.0; // Default value
  }
}

Future<double> getLasttransefer() async {
  List<dynamic> debitList = await getnotificationList();
  if (debitList.isNotEmpty) {
    return double.parse(debitList.last[0].toString());
  } else {
    return 0.0; // or return a default value if needed
  }
}