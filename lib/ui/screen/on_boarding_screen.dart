import 'package:billy/global/color.dart';
import 'package:billy/global/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Scaffold(
      backgroundColor: ThemeColors.transactionSuccess,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(150),
              ).copyWith(top: screenUtil.setHeight(118)),
              child: Text(
                'billy',
                style: TextStyle(
                  fontFamily: CustomTheme.themeSecondFont,
                  fontWeight: FontWeight.w600,
                  fontSize: 63.sp,
                ),
              ),
            ),
            Text(
              'making bills easy',
              style: TextStyle(
                fontFamily: CustomTheme.themeSecondFont,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(62),
            ),
            Container(
              height: screenUtil.setHeight(424),
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/onboarding/onboarding.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(24),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                width: screenUtil.setWidth(336),
                height: screenUtil.setHeight(50),
                alignment: Alignment.center,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19.sp,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeColors.primaryColorLight,
                ),
                elevation: MaterialStateProperty.all(0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
