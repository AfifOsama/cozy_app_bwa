import 'package:cozy_bwa/pages/home_page.dart';
import 'package:cozy_bwa/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/404_error.png',
              width: MediaQuery.of(context).size.width - 76,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going?',
              style: blackMediumTextStyle.copyWith(fontSize: 24),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were\nrequested is already gone',
              style: greyLightTextStyle.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              child: Text(
                'Back to Home',
                style: whiteMediumTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  primary: purpleColor,
                  minimumSize: Size(210, 50)),
            )
          ],
        ),
      ),
    );
  }
}
