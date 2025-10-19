import 'package:flutter/material.dart';
import 'package:learnsphere/data/settings_data.dart';
import 'package:learnsphere/widgets/app_text_style.dart';
import 'package:learnsphere/widgets/colors.dart';
import 'package:learnsphere/widgets/settings_tile.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF9FAFB),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.purple,
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            // title card
            Stack(
              children: [
                // container color
                Container(
                  color: Color(0xFFF9FAFB),
                  // color: Colors.green,
                  height: 125,
                  child: Column(
                    children: [
                      // color Container
                      Container(height: 70, color: AppColors.purple),
                    ],
                  ),
                ),
                // name tile
                Positioned(
                  top: 20,
                  left: 15,
                  right: 15,
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.appButtonColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'J',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        'Jack Sparrow',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5.0,
                        children: [
                          Text(
                            'jacksparrow@gmail.com',
                            style: TextStyle(
                              color: AppColors.iconColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'View Account Details',
                            style: TextStyle(
                              color: AppColors.purple,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Card(
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 8.0,
                    right: 5.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'get Free consultation From\nOur Experts',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // call back button
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: AppColors.appButtonColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '📞 Get a Callback',
                            style: TextStyle(
                              color: AppColors.appButtonColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // other details
            SizedBox(height: 15),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: List.generate(settingsData.length, (index) {
                  return SettingsTile(
                    icon: index,
                    title: settingsData[index]['title'],
                    subTitle: settingsData[index]['subtitle'],
                    isSignOut: (index == 5) ? true : false,
                  );
                }),
              ),
            ),

            // social media logos
            SizedBox(height: 15.0),
            Center(
              child: Text(
                'Scaler on social platforms',
                style: TextStyle(fontSize: 15, color: Colors.grey[400]),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.0,
              children: [
                socialMedia('assets/images/social_media/instagram.png'),
                socialMedia('assets/images/social_media/linkedin.png'),
                socialMedia('assets/images/social_media/twitter.png'),
                socialMedia('assets/images/social_media/youtube.png'),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget socialMedia(String img) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Image.asset(img, color: Colors.grey[400], height: 25),
      ),
    );
  }
}
