import 'package:flutter/material.dart';
import 'package:learnsphere/data/program_data.dart';
import 'package:learnsphere/widgets/learning_card.dart';
import 'package:learnsphere/widgets/program_card.dart';

import '../widgets/colors.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.06,
                  // bottom: height * 0.03,
                  top: height * 0.03,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome back, Rup!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/Avatar.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.06,
                  right: width * 0.06,
                ),
                child: Row(
                  children: [
                    Text(
                      'Upcoming Events',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: AppColors.appButtonColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // upcoming events
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    spacing: 15,
                    children: [
                      // SizedBox(width: 15),
                      ProgramCard(
                        title: 'S.O.L.I.D Principle Evry Developer Must Know',
                        author: 'Pragy Agarwal Ex media.net',
                        isRegistered: true,
                      ),
                      ProgramCard(
                        title: 'Roadmap to Data Engineering',
                        author: 'shivank Agarwal Ex Microsoft',
                        isRegistered: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // list of courses - title
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: 15,
                ),
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.lightPurple],
                    begin: AlignmentGeometry.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learn Your favourite Coding \nLanguage in All',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '• Courses  • Articles  • Interview Guides',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),

              // list of course
              Column(
                children: List.generate(
                  programData.length,
                  (index) => LearningCard(
                    name: programData[index]['name'],
                    learners: programData[index]['learners'],
                    courses: programData[index]['courses'],
                    articles: programData[index]['articles'],
                    logo: programData[index]['logo'],
                  ),
                ),
              ),

              Container(
                width: width * 1,
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: 15.0,
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: AppColors.appButtonColor),
                ),
                child: Center(
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: AppColors.appButtonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
