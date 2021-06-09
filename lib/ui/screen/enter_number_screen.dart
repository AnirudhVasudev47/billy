import 'package:billy/global/color.dart';
import 'package:billy/ui/widget/phone_number_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({Key? key}) : super(key: key);



  @override
  _EnterNumberScreenState createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  TextEditingController phoneController = new TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/onboarding/cancel.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PhoneAuthWidget(),
    );
  }
}
