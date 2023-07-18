import 'package:craft_my_plate/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
      this.icon, {
        this.onTap,
        this.color = Colors.grey,
        this.activeColor = kPrimary,
        this.isActive = false,
      });

  final String icon;
  final Color color;
  final Color activeColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(7),

        child: SvgPicture.asset(
          icon,
          color: isActive ? kPrimary : color,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}