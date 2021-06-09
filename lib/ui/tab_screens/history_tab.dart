import 'package:billy/global/color.dart';
import 'package:billy/ui/widget/history_tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = new ScreenUtil();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(top: screenUtil.setHeight(60)),
          alignment: Alignment.center,
          child: Text(
            'HISTORY',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: ThemeColors.primaryColorLight,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(22),
            horizontal: screenUtil.setWidth(19),
          ).copyWith(left: screenUtil.setWidth(13)),
          margin: EdgeInsets.symmetric(
            horizontal: screenUtil.setHeight(25),
          ).copyWith(top: screenUtil.setHeight(36)),
          child: Row(
            children: [
              Text(
                'Closing Balance',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '₹1,360.22',
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: screenUtil.setHeight(14),
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: screenUtil.setHeight(12),
                    ),
                    child: HistoryTabCard(
                      title: 'Broadband (Act Fibernet)',
                      subtitle: 'March 3rd',
                      trailing: '-₹580.34$i',
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
