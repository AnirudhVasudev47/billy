import 'package:billy/global/color.dart';
import 'package:billy/ui/widget/home_tab_header.dart';
import 'package:billy/ui/widget/home_tab_upcoming_bill_card.dart';
import 'package:billy/ui/widget/pending_bill_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ScreenUtil screenUtil = new ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTabHeader(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(),
                Container(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(18),
                    left: screenUtil.setWidth(25),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomeTabUpcomingBillCard(
                          amount: '-₹580.34',
                          date: 'Tomorrow',
                        ),
                        HomeTabUpcomingBillCard(
                          amount: '-₹580.34',
                          date: 'Tomorrow',
                        ),
                        HomeTabUpcomingBillCard(
                          amount: '-₹580.34',
                          date: 'Tomorrow',
                        ),
                        HomeTabUpcomingBillCard(
                          amount: '-₹580.34',
                          date: 'Tomorrow',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(21),
                    left: screenUtil.setWidth(25),
                  ),
                  child: Text(
                    'Bills pending approval',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                PendingBillCard(
                  image: 'assets/images/home_tab/netflix.png',
                  title: 'Netflix',
                  subTitle: 'Premium Subscription',
                  amount: '-₹799.00',
                  onTap: () {
                    print("pay tapped!!");
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(23),
                    left: screenUtil.setWidth(25),
                  ),
                  child: Text(
                    'Bills pending approval',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                ListTile(
                  leading: Container(
                    child: Image.asset('assets/images/home_tab/netflix.png'),
                  ),
                  title: Text(
                    'Broadband (Act Fibernet)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'March 3rd',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Text(
                    '-₹580.34',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  headerWidget() {
    return Container(
      padding: EdgeInsets.only(
        top: screenUtil.setHeight(25),
        left: screenUtil.setWidth(25),
        right: screenUtil.setWidth(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Upcoming Bills',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  '-₹2780.34',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 19.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
