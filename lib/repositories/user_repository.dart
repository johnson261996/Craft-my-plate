
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../widgets/showalertdialog.dart';


class UserRepository with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  String errorMessage = '';

  //Method for generate otp from firebase
  Future<void> generateOtp(String contact,BuildContext context) async {
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
    } catch (error) {
       //handleError(e as PlatformException);
      final e = error as PlatformException;
      print("error:$e");
      switch (error.code) {
        case 'ERROR_INVALID_VERIFICATION_CODE':
          FocusScope.of(context).requestFocus(FocusNode());
            errorMessage = 'Invalid Code';
            notifyListeners();
          showAlertDialog(context, 'Invalid Code');
          break;
        default:
          showAlertDialog(context, error.message);
          break;
      }
      // Navigator.pop(context, (e as PlatformException).message);
    }
  }


  //Method for verify otp entered by user
  Future<void> verifyOtp(BuildContext c,String smsOTP) async {
    print("sms OTP:$smsOTP");
    print("verid_otp:${verificationId}");
    if (smsOTP == null || smsOTP == '') {
      showAlertDialog(c, 'please enter 6 digit otp');
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
      Navigator.pushNamed(c,"/userdetails");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (c) =>  HomeScreen()),
      // );
    }  catch (e, stackTrace) {
      print("Exception: $e\n$stackTrace");
      showAlertDialog(c, e.toString());
    }
  }



}