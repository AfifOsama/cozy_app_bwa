import 'package:flutter/material.dart';

import '../theme.dart';

class MainFacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int numberOfItems;
  const MainFacilityItem(
      {required this.name,
      required this.imageUrl,
      required this.numberOfItems,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$numberOfItems',
            style: purpleMediumTextStyle,
            children: [
              TextSpan(
                text: ' $name',
                style: greyLightTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
