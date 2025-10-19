import 'package:flutter/material.dart';
import 'package:learnsphere/screens/ProgramType.dart';

import '../data/program_data.dart';
import '../widgets/colors.dart';
import '../widgets/learning_card.dart';

class ProgramlistScreen extends StatefulWidget {
  const ProgramlistScreen({super.key});

  @override
  State<ProgramlistScreen> createState() => _ProgramlistScreenState();
}

class _ProgramlistScreenState extends State<ProgramlistScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'Programs List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 15),
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

        // filters
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(filterData.length, (index) {
              return chipText(filterData[index]['title']);
            }),
          ),
        ),

        // list of course
        Column(
          children: List.generate(
            coursesData.length,
            (index) => LearningCard(
              name: coursesData[index]['name'],
              learners: coursesData[index]['learners'],
              courses: coursesData[index]['courses'],
              articles: coursesData[index]['articles'],
              logo: coursesData[index]['logo'],
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Programtype(data: coursesData[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget chipText(String name) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 226, 230, 234),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
