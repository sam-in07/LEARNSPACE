import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/program_card.dart';
import 'ProgramScreens/ProgramDetailScreen.dart';

class Myprogramscreen extends StatefulWidget {
  const Myprogramscreen({super.key});

  @override
  State<Myprogramscreen> createState() => _MyprogramscreenState();
}

class _MyprogramscreenState extends State<Myprogramscreen> {
  late final FirebaseFirestore _firestore;
  bool isLoading = true;

  dynamic data1 = {};
  dynamic data2 = {};

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
    getData();
  }

  // 🔹 Fetch data from Firestore
  void getData() async {
    try {
      final res = await _firestore
          .collection('course_list')
          .doc('python')
          .collection('courses')
          .get();

      if (res.docs.isNotEmpty) {
        data1 = Map<String, dynamic>.from(res.docs.first.data());
      }

      final res1 = await _firestore
          .collection('course_list')
          .doc('java')
          .collection('courses')
          .get();

      if (true) {
        data2 = Map<String, dynamic>.from(res1.docs.first.data());
      }

      setState(() {
        isLoading = false;
      });
      debugPrint("MyPgm Data1: $data1");
      debugPrint("MyPgm Data2: $data2");
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
      child: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                spacing: 15.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Programs',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // pick course based on index
                        final course = (index == 0)
                            ? Map<String, dynamic>.from(data1)
                            : Map<String, dynamic>.from(data2);

                        if (course.isEmpty) {
                          return const SizedBox.shrink(); // no data yet
                        }

                        final instructor =
                            (course['instructor_details'] != null &&
                                course['instructor_details'].isNotEmpty)
                            ? Map<String, dynamic>.from(
                                course['instructor_details'][0],
                              )
                            : {};

                        return programCard(
                          title: course['title'] ?? 'Untitled Course',
                          instructor:
                              instructor['name'] ?? 'Unknown Instructor',
                          rating: instructor['rating']?.toString() ?? '0',
                          totalHours: course['total_hours']?.toString() ?? '--',
                          course: course,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Text(
                    'Similar Events',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        spacing: 15,
                        children: [
                          // SizedBox(width: 15),
                          ProgramCard(
                            title:
                                'S.O.L.I.D Principle Evry Developer Must Know',
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
                ],
              ),
            ),
    );
  }

  // 🔹 Course Card Widget
  Widget programCard({
    required String title,
    required String instructor,
    required String rating,
    required String totalHours,
    required Map<String, dynamic> course,
    required int index,
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
        margin: const EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.8, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Instructor image / left section
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

            // Course details
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
                        iconText('$totalHours hrs', Icons.alarm),
                      ],
                    ),
                    // Text('50% complete', style: TextStyle(color: Colors.grey.shade200),)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          // color: Colors.blue,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: (index == 1) ? 100 : 50,
                              color: Colors.blue,
                            ),
                            Expanded(
                              child: Container(color: Colors.grey.shade300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: const Size(200, 35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Continue Learning',
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

  // 🔹 Helper widgets
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
}
