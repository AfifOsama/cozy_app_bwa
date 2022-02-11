import 'package:cozy_bwa/theme.dart';
import 'package:flutter/material.dart';

import '../model/city.dart';

class CityCard extends StatelessWidget {
  final City city;
  const CityCard({required this.city, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        color: const Color(0xffF6F7F8),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  city.imageUlr,
                  height: 102,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  city.name,
                  style: blackMediumTextStyle.copyWith(fontSize: 16),
                ),
              ],
            ),
            city.isFavorite
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/icon_star.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
