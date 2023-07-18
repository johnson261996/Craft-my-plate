
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacementNamed('/walkthrough'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7e5b7),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff6318AF)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo.png',
                height: 150,
                width: 100,
              ),
              Text(
                'Craft My Plate',
                style: GoogleFonts.capriola( textStyle: TextStyle(color: Color(0xfff7e5b7), letterSpacing: .5,fontSize: 32)),
              ),
              Text(
                'you customise, We cater',
                style: GoogleFonts.capriola( textStyle: TextStyle(color: Color(0xfff7e5b7), letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

