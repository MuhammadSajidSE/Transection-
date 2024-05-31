import 'package:flutter/material.dart';

class BottomBaring extends StatelessWidget {
  final TabController tabController;
  final List<Color> colors;
  final int currentPage;

  BottomBaring({
    required this.tabController,
    required this.colors,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 151, 151, 151), Colors.black],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBar(
              controller: tabController,
              tabs: [
                _buildTabIcon(Icons.home, 0),
                _buildTabIcon(Icons.search, 1),
                _buildTabIcon(Icons.person, 2),
              ],
              indicator: const BoxDecoration(), // Remove the bottom line
              indicatorColor: Colors.transparent,
              unselectedLabelColor: const Color.fromARGB(255, 130, 130, 130),
              labelColor: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildTabIcon(IconData icon, int index) {
    bool isSelected = currentPage == index;
    return Tab(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: isSelected ? Colors.black : const Color.fromARGB(255, 130, 130, 130),
        ),
      ),
    );
  }
}
