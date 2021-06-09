import 'package:billy/global/color.dart';
import 'package:billy/model/rewards_model.dart';
import 'package:billy/ui/widget/bill_tab_reward_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillTab extends StatefulWidget {
  const BillTab({Key? key}) : super(key: key);

  @override
  _BillTabState createState() => _BillTabState();
}

class _BillTabState extends State<BillTab> {
  ScreenUtil screenUtil = new ScreenUtil();
  Stream<QuerySnapshot> rewardsStream =
      FirebaseFirestore.instance.collection('offers').snapshots();
  List<RewardsModel> rewards = [];

  TextEditingController searchController = new TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: screenUtil.setHeight(60),
            left: screenUtil.setWidth(25),
          ),
          child: Text(
            'Top offers for you',
            style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: screenUtil.setHeight(9),
            right: screenUtil.setWidth(9),
            bottom: screenUtil.setHeight(31),
          ),
          child: rewardsWidget(),
        ),
        searchTextField(),
        searchController.text.isEmpty?
            Container(child: Text('appbar'),):
            Container(child: Text('search result'),),
      ],
    );
  }

  searchTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(21),
      ),
      child: TextField(
        controller: searchController,
        onChanged: (text){
          setState(() {
            searchText = text;
          });
        },
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22.sp,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeColors.primaryColorLight, width: 1.0),
          ),
          counterText: '',
          isDense: true,
          border: OutlineInputBorder(),
          hintText: 'Eg. Mobile Recharge',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(16),
              right: screenUtil.setWidth(10),
            ),
            child: SvgPicture.asset(
              'assets/images/bill_tab/search.svg',
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            // maxHeight: screenUtil.setHeight(17),
            // maxWidth: screenUtil.setWidth(17),
            minHeight: screenUtil.setHeight(17),
            minWidth: screenUtil.setWidth(17),
          ),
          labelText: 'search for utilities and recharges',
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(9),
          ),
        ),
      ),
    );
  }

  rewardsWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: rewardsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;
          getList(messages);
          return Container(
            padding: EdgeInsets.only(
              right: screenUtil.setWidth(9),
            ),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: screenUtil.setHeight(141),
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 360 / 141,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.85,
              ),
              itemCount: rewards.length,
              itemBuilder: (context, index, i) {
                return BillTabRewardCard(
                  title: rewards.elementAt(index).title,
                  desc: rewards.elementAt(index).desc,
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  getList(var messages) {
    return messages.forEach((element) {
      final title = element['title'];
      final desc = element['desc'];
      rewards.add(RewardsModel(title, desc));
    });
  }
}
