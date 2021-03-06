import 'package:cozy_bwa/pages/error_page.dart';
import 'package:cozy_bwa/theme.dart';
import 'package:cozy_bwa/widgets/main_facility_item.dart';
import 'package:cozy_bwa/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/space.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  const DetailPage({required this.space, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchURL(_url) async {
      if (await canLaunch(_url)) {
        launch(_url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
        // throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name!,
                                  style: blackMediumTextStyle.copyWith(
                                      fontSize: 22),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$ ${space.price!}',
                                    style: purpleMediumTextStyle.copyWith(
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyLightTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map(
                                (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating!,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: Text(
                          'Main Facilities',
                          style: blackRegularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainFacilityItem(
                                name: 'kitchen',
                                imageUrl: 'assets/images/icon_kitchen.png',
                                numberOfItems: space.numberOfKitchens),
                            MainFacilityItem(
                                name: 'Bedroom',
                                imageUrl: 'assets/images/icon_bedroom.png',
                                numberOfItems: space.numberOfBedrooms),
                            MainFacilityItem(
                                name: 'Wardrobe',
                                imageUrl: 'assets/images/icon_wardrobe.png',
                                numberOfItems: space.numberOfCupboards),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: Text(
                          'Photos',
                          style: blackRegularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space.photos!.map((imgUrl) {
                              return Container(
                                margin: EdgeInsets.only(left: edge24),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    imgUrl,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: Text(
                          'Location',
                          style: blackRegularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyLightTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                _launchURL(space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/images/btn_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge24),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL('tel://+${space.phone}');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            primary: purpleColor,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteMediumTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
