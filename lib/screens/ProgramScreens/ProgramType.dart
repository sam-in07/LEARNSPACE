import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnsphere/screens/ProgramScreens/ProgramDetailScreen.dart';
import 'package:learnsphere/widgets/colors.dart';

class Programtype extends StatefulWidget {
  const Programtype({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<Programtype> createState() => _ProgramtypeState();
}

class _ProgramtypeState extends State<Programtype> {
  late final FirebaseFirestore _firestore;
  late final String programId;

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
    programId = widget.data['program_name'].toString().toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('course_list')
                  .doc(programId)
                  .collection('courses')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5.0,
                      children: [
                        Text(
                          "New Courses are coming soon!",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'We are preparing new Course for You.\nExplore other Courses till then.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  );
                }

                final courses = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course =
                        courses[index].data() as Map<String, dynamic>;

                    final instructor =
                        (course['instructor_details'] != null &&
                            course['instructor_details'].isNotEmpty)
                        ? course['instructor_details'][0]
                        : {};

                    return programCard(
                      title: course['title'] ?? 'Untitled Course',
                      instructor: instructor['name'] ?? 'Unknown Instructor',
                      rating: instructor['rating'] ?? '0',
                      totalHours: course['total_hours'] ?? '--',
                      course: course,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Program card (for each course)
  Widget programCard({
    required String title,
    required String instructor,
    required String rating,
    required String totalHours,
    required Map<String, dynamic> course,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => Programdetailscreen(courseData: course),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.8, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // logo/instructor image section
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 170,
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 49, 24, 74),
                        Color.fromARGB(255, 69, 47, 122),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/person/person.jpg',
                  height: 120,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 3),
                    color: Colors.pink[700],
                    child: Center(
                      child: Text(
                        instructor,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // details
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  spacing: 8.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5,
                      children: [chipText(true), chipText(false)],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      spacing: 5.0,
                      children: [
                        iconText('$rating ★ Rating', Icons.star_outline),
                        iconText(totalHours, Icons.alarm),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: const Size(200, 35),
                        padding: const EdgeInsets.all(10),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row iconText(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade700, size: 18),
        Text(
          ' $text',
          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  Widget chipText(bool isRegistered) {
    final text = (isRegistered) ? '✅ Registered' : '📈 4.90 Rating';
    final chipColor = (isRegistered)
        ? Colors.green[100]
        : const Color.fromARGB(59, 228, 212, 212);
    final chipTextColor = (isRegistered) ? Colors.green : Colors.black54;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: TextStyle(color: chipTextColor, fontSize: 12)),
    );
  }

  Widget appBar() {
    return Stack(
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.lightPurple],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.data['logo_url'] ?? '',
                height: 50,
                width: 50,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, color: Colors.white),
              ),
              Text(
                ' ${widget.data['program_name']} Hub',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
