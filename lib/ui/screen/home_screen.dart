import 'package:billy/global/color.dart';
import 'package:billy/ui/tab_screens/bill_tab.dart';
import 'package:billy/ui/tab_screens/history_tab.dart';
import 'package:billy/ui/tab_screens/home_tab.dart';
import 'package:billy/ui/tab_screens/one_bill_tab.dart';
import 'package:billy/ui/tab_screens/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/home_page/home.svg'),
              activeIcon: SvgPicture.asset('assets/images/home_page/home.svg'),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home_page/bill.svg'),
            label: 'Bill',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home_page/onebill.svg'),
            label: '\"ONE BILL\"',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home_page/history.svg'),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home_page/profile.svg'),
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
