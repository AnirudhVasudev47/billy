import 'package:billy/global/color.dart';
import 'package:billy/services/authentication.dart';
import 'package:billy/ui/widget/profile_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: screenUtil.setHeight(60),
            bottom: screenUtil.setHeight(42),
          ),
          alignment: Alignment.center,
          child: Text(
            'PROFILE',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
            ),
          ),
        ),
        Divider(
          color: ThemeColors.dividerColor,
          height: 0,
          thickness: 0.8,
          indent: 24,
          endIndent: 24,
        ),
        Container(
          margin: EdgeInsets.only(
            top: screenUtil.setHeight(35),
            left: screenUtil.setWidth(107),
          ),
          child: Text(
            'User Name',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19.sp,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: screenUtil.setWidth(107),
            bottom: screenUtil.setHeight(33),
          ),
          child: Text(
            context.read<AuthenticationService>().getUserNumber().toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19.sp,
            ),
          ),
        ),
        Divider(
          color: ThemeColors.dividerColor,
          height: 0,
          thickness: 0.8,
          indent: 24,
          endIndent: 24,
        ),
        SizedBox(
          height: screenUtil.setHeight(40),
        ),
        ProfileOptionCard(
          leading: SvgPicture.asset('assets/images/profile_tab/refer.svg'),
          title: 'Share with friends',
          onPressed: () {
            print('test');
            Share.share('check out my website https://example.com');
          },
        ),
        ProfileOptionCard(
          leading: SvgPicture.asset('assets/images/profile_tab/rate_us.svg'),
          title: 'Rate Us',
          onPressed: () {
            print('test');
            // Share.share('check out my website https://example.com');
          },
        ),
        ProfileOptionCard(
          leading: SvgPicture.asset(
              'assets/images/profile_tab/help_and_support.svg'),
          title: 'Help and Support',
          onPressed: () {
            print('test');
            // Share.share('check out my website https://example.com');
          },
        ),
        ProfileOptionCard(
          leading: SvgPicture.asset('assets/images/profile_tab/about.svg'),
          title: 'About',
          onPressed: () {
            print('test');
            // Share.share('check out my website https://example.com');
          },
        ),
      ],
    );
  }
}
