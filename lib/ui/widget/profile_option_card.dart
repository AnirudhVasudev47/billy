import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptionCard extends StatelessWidget {
  const ProfileOptionCard(
      {Key? key,
      required this.leading,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final Widget leading;
  final String title;
  final Function () onPressed;

  @override
  Widget build(BuildContext context) {
    // ScreenUtil screenUtil = new ScreenUtil();
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        dense: true,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
