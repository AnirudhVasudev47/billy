import 'package:billy/global/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryTabCard extends StatelessWidget {
  const HistoryTabCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.trailing})
      : super(key: key);

  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Container(
      padding: EdgeInsets.only(
        left: screenUtil.setWidth(70),
        right: screenUtil.setWidth(27),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.subtitleColor,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            trailing,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
