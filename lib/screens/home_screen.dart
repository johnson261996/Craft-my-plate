import 'package:craft_my_plate/widgets/build_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/build_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          physics: const BouncingScrollPhysics(),
          children: [
            BuildAppBar(),
            BuildBody(),

          ],
        ),
      ),
    );
  }
}
