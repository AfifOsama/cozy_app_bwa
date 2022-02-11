import 'package:cozy_bwa/model/city.dart';
import 'package:cozy_bwa/model/space.dart';
import 'package:cozy_bwa/model/tips.dart';
import 'package:cozy_bwa/providers/space_provider.dart';
import 'package:cozy_bwa/theme.dart';
import 'package:cozy_bwa/widgets/bottom_nav_bar.dart';
import 'package:cozy_bwa/widgets/city_card.dart';
import 'package:cozy_bwa/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/space_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: edge24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: HEADING/TITLE
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge24),
                    child: Text(
                      'Explore Now',
                      style: blackMediumTextStyle.copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge24),
                    child: Text(
                      'Mencari kosan yang cozy',
                      style: greyLightTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //NOTE: POPULAR CITIES
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge24),
                    child: Text(
                      'Popular Cities',
                      style: blackRegularTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                            id: 1,
                            name: 'Jakarta',
                            imageUlr: 'assets/images/city1.png',
                            isFavorite: false,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                            id: 1,
                            name: 'Bandung',
                            imageUlr: 'assets/images/city2.png',
                            isFavorite: true,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                            id: 1,
                            name: 'Surabaya',
                            imageUlr: 'assets/images/city3.png',
                            isFavorite: false,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //NOTE: RECOMMENDED SPACE
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge24),
                    child: Text(
                      'Recommended Space',
                      style: blackRegularTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge24),
                      child: FutureBuilder(
                        future: spaceProvider.getRecommendedSpace(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Space> dataSpaces =
                                snapshot.data as List<Space>;
                            var index = 0;
                            return Column(
                              children: dataSpaces.map(
                                (item) {
                                  index++;
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top: index == 1 ? 0 : 30),
                                    child: SpaceCard(space: item),
                                  );
                                },
                              ).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  //NOTE: TIPS & GUIDANCE
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge24),
                    child: Text(
                      'Tips & Guidance',
                      style: blackRegularTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge24),
                    child: Column(
                      children: [
                        TipsCard(
                          tips: Tips(
                              id: 1,
                              title: 'City Guidelines',
                              updateAt: '20 Apr',
                              imageUrl: 'assets/images/tips1.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TipsCard(
                          tips: Tips(
                              id: 2,
                              title: 'Jakarta Fairship',
                              updateAt: '11 Dec',
                              imageUrl: 'assets/images/tips2.png'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: //NOTE: BOTTOM NAV BAR
          Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: edge24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: const Color(0xffF6F7F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavBar(
              icon: Icons.home,
              isActive: true,
            ),
            BottomNavBar(
              icon: Icons.mail,
              isActive: false,
            ),
            BottomNavBar(
              icon: Icons.credit_card,
              isActive: false,
            ),
            BottomNavBar(
              icon: Icons.favorite,
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
