import 'package:billy/global/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabUpcomingBillCard extends StatelessWidget {
  const HomeTabUpcomingBillCard(
      {Key? key, required this.amount, required this.date})
      : super(key: key);

  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Container(
      padding: EdgeInsets.only(
        right: screenUtil.setWidth(22),
        bottom: screenUtil.setHeight(5),
      ),
      child: InkWell(
        onTap: () {
          print('test pressed!');
        },
        child: Container(
          height: screenUtil.setHeight(114),
          width: screenUtil.setWidth(155),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffeeeeee),
                offset: Offset(01.0, 01.0),
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: screenUtil.setHeight(50),
                  left: screenUtil.setWidth(15),
                ),
                child: Text(
                  amount,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenUtil.setWidth(26),
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
