import 'package:craft_my_plate/utils/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../widgets/showalertdialog.dart';
import 'home_screen.dart';


class VerifyOTPScreen extends StatefulWidget {
  String? contact;
   VerifyOTPScreen({Key? key, this.contact}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  bool _otpFilled = false;
  String _otp = "";
  late String smsOTP;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage = '';
  String? verificationId;
  String? result;

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

  //Method for generate otp from firebase
  Future<void> generateOtp(String contact) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      verificationId = verId;
      print("verid:$verificationId");
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: contact,
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {

          },
          verificationFailed: (FirebaseAuthException  exception) {
            // Navigator.pop(context, exception.message);
          });
    } catch (e) {
      handleError(e as PlatformException);
      // Navigator.pop(context, (e as PlatformException).message);
    }
  }


  //Method for verify otp entered by user
  Future<void> verifyOtp(BuildContext c) async {
    print("sms OTP:$smsOTP");
    print("verid_otp:${verificationId}");
    if (smsOTP == null || smsOTP == '') {
      showAlertDialog(context, 'please enter 6 digit otp');
      return;
    }
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsOTP,
      );
      final UserCredential user = await _auth.signInWithCredential(credential);
      final User? currentUser = await _auth.currentUser;
      assert(user.user?.uid == currentUser?.uid);
      // Navigator.pushReplacementNamed(context, '/homeScreen');
      Navigator.pushNamed(context,"/userdetails");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (c) =>  HomeScreen()),
      // );
    }  catch (e, stackTrace) {
      print("Exception: $e\n$stackTrace");
      showAlertDialog(context, e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("before contact:${widget.contact}");
    result =  widget.contact!.replaceRange(3, 9,"*******");
    print("after contact:$result");
    Future.delayed(Duration(seconds: 2), ()async{
      await generateOtp(widget.contact!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightCream,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text("OTP Verification", style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "We have sent a verification code to",
              style: TextStyle(
                  fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w700
              ),
            ),

            const SizedBox(height: 10),
             Text(
              result!,
              style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 6,
              // cursorColor: kBlack,
              // enabledBorderColor: Colors.black,
              focusedBorderColor: kLightPrimary,
              showFieldAsBox: false,
              keyboardType: TextInputType.number,
              onSubmit: (code) => setState(
                    () => smsOTP = code ,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => verifyOtp(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn’t receive code? ",
                  style: TextStyle(
                      fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "Resend Again",
                  style: TextStyle(
                      fontSize: 16,color: kPrimary,fontWeight: FontWeight.w700
                  ),
                ),
              ],
            )
          ],
        ),
        );
  }
}
