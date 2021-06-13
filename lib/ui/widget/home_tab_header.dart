import 'package:billy/global/color.dart';
import 'package:billy/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTabHeader extends StatelessWidget {
  const HomeTabHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Container(
      height: screenUtil.setHeight(275),
      width: screenUtil.setWidth(428),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: ThemeColors.transactionSuccess,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: screenUtil.setHeight(55),
              left: screenUtil.setWidth(8),
            ),
            child: IconButton(
              onPressed: () {
                print('notification button pressed');
              },
              icon: SvgPicture.asset('assets/images/home_tab/bell.svg'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: screenUtil.setHeight(13),
              left: screenUtil.setWidth(25),
            ),
            child: Text(
              'billy wallet balance',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: screenUtil.setHeight(15),
                  right: screenUtil.setWidth(3),
                  left: screenUtil.setWidth(25),
                ),
                child: Text(
                  '₹',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                '1,360.22',
                style: TextStyle(
                  fontFamily: CustomTheme.themeSecondFont,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: screenUtil.setHeight(8),
                ),
                child: IconButton(
                  onPressed: () {
                    print('Add money to wallet pressed');
                  },
                  icon: SvgPicture.asset(
                    'assets/images/home_tab/add_wallet.svg',
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(25),
            ),
            child: Text(
              'Updated yesterday at 2:30pm',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
