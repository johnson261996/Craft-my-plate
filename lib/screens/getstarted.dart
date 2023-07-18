
import 'dart:async';

import 'package:craft_my_plate/screens/verify_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colours.dart';
import '../widgets/country_picker.dart';
import '../widgets/showalertdialog.dart';
import 'home_screen.dart';

class GetStartedPage extends StatefulWidget {
  bool _isInit = true;

   GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}



class _GetStartedPageState extends State<GetStartedPage> {
  bool _email = false;
  bool _submit = false;
  bool _loading = false;
  var _dialCode = '';
  var _contact = '';
  String? _phone;
  String? _emailAddress;
  late String phoneNo;


  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Timer _timer;
  final _contactEditingController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  //callback function of country picker
  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data only once after screen load
    if (widget._isInit) {
      // widget._contact = '$_dialCode${_contactEditingController.text}';
      // generateOtp(widget._contact);
      widget._isInit = false;
    }
  }

  //Alert dialogue to show error and response
  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  //Method for handle the errors
  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        showAlertDialog(context, 'Invalid Code');
        break;
      default:
        showAlertDialog(context, error.message);
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: kPureWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:  MediaQuery.of(context).size.height * 0.3,
              width:  MediaQuery.of(context).size.width ,
              child:  Stack(
                children: [
                  Image.asset(
                    "assets/images/login_bg.png",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.370 ,
                    child: Image.asset(
                      "assets/images/Logo.png",
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _key,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "Login or Signup",
                      style: TextStyle(
                          fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CountryPicker(
                            callBackFunction: _callBackFunction,
                            headerText: 'Select Country',
                            headerBackgroundColor: Theme.of(context).primaryColor,
                            headerTextColor: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Expanded(
                            child: TextField(
                              decoration:  InputDecoration(
                                hintText: 'Enter phone Number',
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 16.5),
                              ),
                              onChanged: (val){
                                if (val.isNotEmpty && val.length > 9) {
                                  setState(() => _submit = true);
                                } else if (_submit != false) {
                                  setState(() => _submit = false);
                                }
                              },
                              controller: _contactEditingController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: _submit
                            ? (_loading
                            ? null
                            : () {
                          setState(() {
                            _loading = true;
                          });
                          _contact = '$_dialCode${_contactEditingController.text}';

                          if (_key.currentState != null &&
                              _key.currentState!.validate()) {
                            _key.currentState!.save();

                            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>VerifyOTPScreen(contact:_contact,)));

                            // generateOtp(
                            //   _phone!,
                            //   _emailAddress,
                            // ).then((otpSent) {
                            //   if (otpSent) {
                            //     Navigator.of(context).push(
                            //       PageTransition(
                            //         type: PageTransitionType.fade,
                            //         child: VerifyOTPPage(
                            //           phoneNumber:
                            //           _phone.toString(),
                            //         ),
                            //       ),
                            //     );
                            //   }
                            // });
                           // Navigator.pushNamed(context,"/verifyotp",arguments: _contact);

                          }

                          setState(() {
                            _loading = false;
                          });
                        })
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _submit ? kPrimary: null,
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 30,
                          ),
                        ),
                        child:  Text("Continue",style: TextStyle(color:_submit ? Colors.white : null, ),),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  const Text(
                    "By continuing, you agree to our",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          // await launchUrl(
                          //   Uri(
                          //     scheme: "https",
                          //     host: "www.ostello.co.in",
                          //     path: "terms/",
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: kBodyTextColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: ()  {

                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: kBodyTextColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}