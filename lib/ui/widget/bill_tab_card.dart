import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillTabCard extends StatelessWidget {
  const BillTabCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final String icon;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenUtil.setHeight(25),
        ).copyWith(left: screenUtil.setWidth(30)),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: screenUtil.setWidth(36),
              height: screenUtil.setHeight(36),
            ),
            SizedBox(
              width: screenUtil.setWidth(31),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
