import 'package:billy/global/color.dart';
import 'package:billy/ui/tab_screens/bill_tab.dart';
import 'package:billy/ui/tab_screens/history_tab.dart';
import 'package:billy/ui/tab_screens/home_tab.dart';
import 'package:billy/ui/tab_screens/one_bill_tab.dart';
import 'package:billy/ui/tab_screens/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = new ScreenUtil();
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    BillTab(),
    OneBillTab(),
    HistoryTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
            ),
            label: 'Bill',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_awesome_motion,
            ),
            label: 'One Bill',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'Profile',
          ),
        ],
        iconSize: ScreenUtil().setWidth(30),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(size: ScreenUtil().setWidth(30)),
        selectedItemColor: ThemeColors.primaryColorLight,
        unselectedItemColor: Colors.blueGrey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
