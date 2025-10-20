import 'package:flutter/material.dart';
import 'package:learnsphere/data/programdetails_data.dart';

class Programdetailscreen extends StatefulWidget {
  const Programdetailscreen({super.key});

  @override
  State<Programdetailscreen> createState() => _ProgramdetailscreenState();
}

class _ProgramdetailscreenState extends State<Programdetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Details'),
        actions: [Icon(Icons.share_outlined), SizedBox(width: 10)],
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: List.generate(programDetailsData.length, (index) {
                return programCard(
                  index + 1,
                  programDetailsData[index]['title'],
                  programDetailsData[index]['courseTitle'],
                );
              }),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text('Start Learning', style: TextStyle(color: Colors.white)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget description(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 0.8, color: Colors.grey.shade400),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 8.0,
            bottom: 8.0,
            right: 8.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget programCard(int index, String title, List<String> courseDecription) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.8, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: Colors.grey.shade400),
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MODULE ${index.toString()}',
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ],
        ),
        subtitle: Text(
          '1h 42m | 7 chapters',
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        // children: [
        //   description('Introduction to python and SQL for Data Science Course'),
        //   description('Python , Anaconda and relevant package installations'),
        //   description('Why learn Pyhthon?'),
        //   description('Keywords and identifiers'),
        //   description('comments, indentation and statement'),
        // ],
        children: List.generate(courseDecription.length, (index) {
          return description(courseDecription[index]);
        }),
      ),
    );
  }
}
