
import 'package:craft_my_plate/repositories/user_repository.dart';
import 'package:craft_my_plate/screens/getstarted.dart';
import 'package:craft_my_plate/screens/root_app.dart';
import 'package:craft_my_plate/screens/splash/splash_screen1.dart';
import 'package:craft_my_plate/screens/splash/splash_screen2.dart';
import 'package:craft_my_plate/screens/user_details_screen.dart';
import 'package:craft_my_plate/screens/verify_otp.dart';
import 'package:craft_my_plate/screens/walkthrough_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>(
                create: (ctx) => UserRepository()),
          ],
     child: const MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/splash",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/splash':
          return PageTransition(
            child: const SplashScreen1(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        case '/splash2':
          return PageTransition(
            child: const SplashScreen2(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        case '/walkthrough':
          return PageTransition(
            child: const WalkthroughScreen(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        case '/getstarted':
          return PageTransition(
            child:  GetStartedPage(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        case '/verifyotp':
          return PageTransition(
            child:  VerifyOTPScreen(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        case '/userdetails':
          return PageTransition(
            child:  UserDetailsScreen(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        case '/rootapp':
          return PageTransition(
            child: const RootApp(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        default:
          return null;
      }
    }
    );
  }
}

