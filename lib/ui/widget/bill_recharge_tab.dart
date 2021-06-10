import 'package:billy/global/color.dart';
import 'package:billy/ui/widget/bill_tab_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillRechargeTab extends StatelessWidget {
  const BillRechargeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(18),
          ),
          child: Column(
            children: [
              BillTabCard(
                icon: 'assets/images/bill_tab/mobile.svg',
                title: 'Mobile Recharge',
                onPressed: (){},
              ),
              Divider(
                height: 0,
                thickness: 0.3,
                color: ThemeColors.dividerColor,
                indent: screenUtil.setWidth(25),
                endIndent: screenUtil.setWidth(25),
              ),
              BillTabCard(
                icon: 'assets/images/bill_tab/road.svg',
                title: 'FASTag Recharge',
                onPressed: (){},
              ),
              Divider(
                height: 0,
                thickness: 0.3,
                color: ThemeColors.dividerColor,
                indent: screenUtil.setWidth(25),
                endIndent: screenUtil.setWidth(25),
              ),
              BillTabCard(
                icon: 'assets/images/bill_tab/dth.svg',
                title: 'DTH Recharge',
                onPressed: (){},
              ),
              Divider(
                height: 0,
                thickness: 0.3,
                color: ThemeColors.dividerColor,
                indent: screenUtil.setWidth(25),
                endIndent: screenUtil.setWidth(25),
              ),
              BillTabCard(
                icon: 'assets/images/bill_tab/cable_tv.svg',
                title: 'Cable TV Recharge',
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
