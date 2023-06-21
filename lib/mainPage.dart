import 'package:example/profile.dart';
import 'package:example/statistic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;
    _tabController.addListener(
          () => setState(() => _selectedIndex = _tabController.index,));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 1 ? HomePage() : _selectedIndex == 0 ? Statistic() : Profile(),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            tabs: [
              Tab(icon: _selectedIndex == 0 ? Icon(Icons.insert_chart) : Icon(Icons.insert_chart_outlined_outlined), text: "Statistic",),
              Tab(icon: _selectedIndex == 1 ? Icon(Icons.home) : Icon(Icons.home_outlined), text: "Home",),
              Tab(icon: _selectedIndex == 2 ? Icon(Icons.person) : Icon(Icons.person_outline), text: "Profile",),
            ],
          ),
        )
    );
  }

  Widget tabContainer(BuildContext con, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery
          .of(con)
          .size
          .width,
      height: MediaQuery
          .of(con)
          .size
          .height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
