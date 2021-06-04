import 'package:billy/global/color.dart';
import 'package:billy/ui/screen/enter_number_screen.dart';
import 'package:billy/ui/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class PhoneAuthWidget extends StatefulWidget {
  const PhoneAuthWidget({Key? key}) : super(key: key);

  @override
  _PhoneAuthWidgetState createState() => _PhoneAuthWidgetState();
}

class _PhoneAuthWidgetState extends State<PhoneAuthWidget> {
  static const _url = 'https://google.com';
  ScreenUtil screenUtil = new ScreenUtil();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showLoading = false;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  late String verificationId;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (r) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getMobileFormWidget(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenUtil.setHeight(15),
          ),
          Text(
            'Enter your mobile number\n to get started',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(24),
          ),
          TextField(
            controller: phoneController,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22.sp,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLength: 10,
            decoration: InputDecoration(
              counterText: '',
              isDense: true,
              border: OutlineInputBorder(),
              hintText: '99999 99999',
              hintStyle: TextStyle(
                color: ThemeColors.hintTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 22.sp,
              ),
              labelText: 'Enter your Number',
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(24),
                vertical: screenUtil.setHeight(16),
              ),
              prefix: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenUtil.setWidth(8)),
                child: Text(
                  '+91',
                  style: TextStyle(
                    color: ThemeColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(21),
          ),
          Text.rich(
            TextSpan(
              text: 'By continuing you are agreeing to our\n',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                    color: ThemeColors.primaryColorLight,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async => await canLaunch(_url)
                        ? await launch(_url)
                        : throw 'Could not launch $_url',
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: screenUtil.setHeight(141)),
            child: ElevatedButton(
              onPressed: () async {
                if(phoneController.text.length == 10){
                  setState(() {
                    showLoading = true;
                  });

                  print(phoneController.text.toString());

                  await _auth.verifyPhoneNumber(
                    phoneNumber: '+91' + phoneController.text,
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });
                      //signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                          content:
                              Text(verificationFailed.message.toString())));
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        currentState =
                            MobileVerificationState.SHOW_OTP_FORM_STATE;
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {},
                    timeout: Duration(seconds: 15)
                  );
                } else {
                  _scaffoldKey.currentState!.showSnackBar(SnackBar(
                      content:
                      Text('Please enter a valid number')));
                }
              },
              child: Container(
                width: screenUtil.setWidth(336),
                height: screenUtil.setHeight(50),
                alignment: Alignment.center,
                child: Text(
                  'GET OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19.sp,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeColors.primaryColorLight,
                ),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          )
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenUtil.setHeight(15),
          ),
          Text(
            'OTP\n VERIFICATION',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(24),
          ),
          TextField(
            controller: otpController,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22.sp,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLength: 6,
            decoration: InputDecoration(
              counterText: '',
              isDense: true,
              border: OutlineInputBorder(),
              hintText: 'OTP',
              hintStyle: TextStyle(
                color: ThemeColors.hintTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 22.sp,
              ),
              labelText: 'Enter your OTP',
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(24),
                vertical: screenUtil.setHeight(16),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(21),
          ),
          Text.rich(
            TextSpan(
              text: 'Enter the code received on your phone\n',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                    color: ThemeColors.primaryColorLight,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async => await canLaunch(_url)
                        ? await launch(_url)
                        : throw 'Could not launch $_url',
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: screenUtil.setHeight(141)),
            child: ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: otpController.text,
                );

                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              child: Container(
                width: screenUtil.setWidth(336),
                height: screenUtil.setHeight(50),
                alignment: Alignment.center,
                child: Text(
                  'VERIFY',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19.sp,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeColors.primaryColorLight,
                ),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          )
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}

/*
Container(
      padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenUtil.setHeight(15),
          ),
          Text(
            'Enter your mobile number\n to get started',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(24),
          ),
          TextField(
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22.sp,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLength: 10,
            decoration: InputDecoration(
              counterText: '',
              isDense: true,
              border: OutlineInputBorder(),
              hintText: '99999 99999',
              hintStyle: TextStyle(
                color: ThemeColors.hintTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 22.sp,
              ),
              labelText: 'Enter your Number',
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(24),
                vertical: screenUtil.setHeight(16),
              ),
              prefix: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenUtil.setWidth(8)),
                child: Text(
                  '+91',
                  style: TextStyle(
                    color: ThemeColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(21),
          ),
          Text.rich(
            TextSpan(
              text: 'By continuing you are agreeing to our\n',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                    color: ThemeColors.primaryColorLight,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async => await canLaunch(_url)
                        ? await launch(_url)
                        : throw 'Could not launch $_url',
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: screenUtil.setHeight(141)),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  showLoading = true;
                });
              },
              child: Container(
                width: screenUtil.setWidth(336),
                height: screenUtil.setHeight(50),
                alignment: Alignment.center,
                child: Text(
                  'GET OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19.sp,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeColors.primaryColorLight,
                ),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          )
        ],
      ),
    );
 */

/*
() async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(content: Text(verificationFailed.message.toString())));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
 */
