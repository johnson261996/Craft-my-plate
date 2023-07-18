
import 'package:craft_my_plate/utils/colours.dart';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, Monica!",
          style: TextStyle(
            color: kPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
         SizedBox(
          height: 5,
        ),
        Text(
          "Current location",
          style: TextStyle(
            color: kGray,
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: kPrimary,
              size: 15.0, // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
            ),
            const SizedBox(width: 5),
            Text(
              'Hyderabad',
              style: TextStyle(
                color: kBlack,
                fontSize: 12,
              ),
            ),
            Spacer(),
            Column(
              children: [
                Icon(
                  Icons.play_circle_outline,
                  color: kPrimary,
                  size: 20.0, // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                ),
                Text(
                  'How it works?',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
