import 'package:billy/global/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillTabRewardCard extends StatelessWidget {
  const BillTabRewardCard({Key? key, required this.title, required this.desc}) : super(key: key);

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ThemeColors.transactionSuccess,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10)
      ),
      height: screenUtil.setHeight(141),
      width: screenUtil.setHeight(360),
      padding: EdgeInsets.only(
        top: screenUtil.setHeight(10),
        left: screenUtil.setWidth(16),
        right: screenUtil.setWidth(16),
      ),
      // margin: EdgeInsets.only(
      //   left: screenUtil.setWidth(16),
      //   top: screenUtil.setHeight(9),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
