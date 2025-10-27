import 'package:flutter/material.dart';

class Programdetailscreen extends StatefulWidget {
  final Map<String, dynamic> courseData;

  const Programdetailscreen({super.key, required this.courseData});

  @override
  State<Programdetailscreen> createState() => _ProgramdetailscreenState();
}

class _ProgramdetailscreenState extends State<Programdetailscreen> {
  @override
  Widget build(BuildContext context) {
    final modules = widget.courseData['modules'] as List<dynamic>;
    final instructor = widget.courseData['instructor_details'][0];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(widget.courseData['title']),
        backgroundColor: Colors.white,
        actions: const [Icon(Icons.share_outlined), SizedBox(width: 10)],
        elevation: 0,
      ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instructor Info
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/images/person/person.jpg',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        instructor['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${instructor['rating']} ★ | ${instructor['total_courses']} Courses',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Description
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.courseData['description'],
                style: const TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ),

            // Modules List
            Column(
              children: List.generate(modules.length, (index) {
                final module = modules[index];
                return programCard(
                  index + 1,
                  module['module_name'],
                  List<String>.from(module['topics']),
                  module['total_hours'],
                  module['chapters'],
                );
              }),
            ),
            SizedBox(height: 175),
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
          child: const Text(
            'Start Learning',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget programCard(
    int index,
    String title,
    List<String> topics,
    String hours,
    String chapters,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.8, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MODULE $index',
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ],
        ),
        subtitle: Text(
          '$hours | $chapters',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        children: topics.map((t) => description(t)).toList(),
      ),
    );
  }

  // Widget description(String text) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  //     child: Text(
  //       text,
  //       style: TextStyle(color: Colors.grey[700], fontSize: 13),
  //     ),
  //   );
  // }

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
}
