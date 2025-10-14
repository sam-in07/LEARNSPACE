import 'package:flutter/material.dart';
import 'package:learnsphere/screens/LoginScreen.dart';
import 'package:learnsphere/widgets/app_text.dart';
import 'package:learnsphere/widgets/app_text_style.dart';
import 'package:learnsphere/widgets/colors.dart';
import 'package:learnsphere/widgets/primary_button.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: width * 0.6,
              height: height * 0.15,
              child: Image.asset(
                'assets/images/lsimage.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: height * 0.03),
                // Text(
                //   AppText.lsmoti,
                //   style: AppTextstyle.textStyle16blackW400,
                // ),
            Text(
              'Organize. Track. Achieve. \nYour Learning Journey, Simplified',
              textAlign: TextAlign.center,
              style: AppTextstyle.textStyle16blackW400,
            ),
            SizedBox(height: height * 0.05),
            PrimaryButton(
              height: 55,
              width: 247,
              radius: 5.5,
              color: AppColors.primaryColor,
              title: 'Get Started',
              textStyle:AppTextstyle.textStyle24whiteW400,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}