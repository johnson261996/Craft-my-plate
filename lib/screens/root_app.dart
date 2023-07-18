import 'package:craft_my_plate/screens/home_screen.dart';
import 'package:craft_my_plate/utils/colours.dart';
import 'package:flutter/material.dart';

import '../widgets/bottombar_item.dart';



class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int _activeTabIndex = 0;
  final List _barItems = [
    {
      "icon": "assets/icons/home.svg",
      "page": HomeScreen(),
    },
    {
      "icon": "assets/icons/orders.svg",
      "page": Container(
        alignment: Alignment.center,
        child: Text("Explore"),
      ),
    },
    {
      "icon": "assets/icons/profile.svg",
      "page": Container(
        alignment: Alignment.center,
        child: Text("Nearby"),
      ),
    },
    {
      "icon": "assets/icons/wishlist.svg",
      "page": Text("setting"),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration:  Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (index == _activeTabIndex) return;
    _controller.reset();
    setState(() {
      _activeTabIndex = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        backgroundColor: Colors.transparent,
        child:  Image.asset("assets/images/bottom_Logo.png", ),
        elevation: 0,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTabIndex,
      children: List.generate(
        _barItems.length,
            (index) => _buildAnimatedPage(_barItems[index]["page"]),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: kWhite,
            blurRadius: 1,
            spreadRadius: 3,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          bottom: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _barItems.length,
                (index) => BottomBarItem(
              _barItems[index]["icon"],
              isActive: _activeTabIndex == index,
              activeColor: kPrimary,
              onTap: () => onPageChanged(index),
            ),
          ),
        ),
      ),
    );
  }
}