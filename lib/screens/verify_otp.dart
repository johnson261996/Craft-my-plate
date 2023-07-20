import 'package:craft_my_plate/repositories/user_repository.dart';
import 'package:craft_my_plate/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

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

  String errorMessage = '';

  String? result;
  late UserRepository user;


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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      user = Provider.of<UserRepository>(context, listen: false);
    });
    print("before contact:${widget.contact}");
    result =  widget.contact!.replaceRange(3, 9,"*******");
    print("after contact:$result");
    Future.delayed(Duration(seconds: 2), ()async{
      await user.generateOtp(widget.contact!,context);
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
              onTap: () => user.verifyOtp(context,smsOTP),
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
