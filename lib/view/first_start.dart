import 'package:flutter/material.dart';
import 'package:money_transfer/view/main_home.dart';
import 'package:money_transfer/view/profile.dart';
import 'package:money_transfer/view/transection.dart';
import 'package:money_transfer/widget/navbar.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentPage = 0;
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Adjusted to match the number of tabs
    _tabController.addListener(() {
      setState(() {
        _currentPage = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              MainHome(),
              transection(),
              profile(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(bottom: 16.0),
              child: BottomBaring(
                tabController: _tabController,
                colors: _colors,
                currentPage: _currentPage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}