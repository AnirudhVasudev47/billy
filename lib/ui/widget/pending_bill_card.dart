import 'package:billy/global/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PendingBillCard extends StatelessWidget {
  const PendingBillCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.amount,
      required this.onTap})
      : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final String amount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: screenUtil.setHeight(5),
          ),
          ListTile(
            leading: Container(
              child: Image.asset(image),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Column(
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19.sp,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: onTap,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: screenUtil.setWidth(59),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ThemeColors.primaryColorLight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'PAY',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(18),
          ),
          InkWell(
            onTap: () {
              print("see all pressed");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenUtil.setHeight(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  SvgPicture.asset('assets/images/home_tab/dots.svg')
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(12),
          ),
          Divider(
            height: 0,
            thickness: 0.3,
            indent: screenUtil.setWidth(14),
            endIndent: screenUtil.setWidth(14),
          ),
        ],
      ),
    );
  }
}
