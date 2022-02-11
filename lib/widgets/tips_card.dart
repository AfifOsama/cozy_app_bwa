import 'package:cozy_bwa/theme.dart';
import 'package:flutter/material.dart';

import '../model/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard({required this.tips, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackMediumTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              'Updated ${tips.updateAt}',
              style: greyLightTextStyle,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
