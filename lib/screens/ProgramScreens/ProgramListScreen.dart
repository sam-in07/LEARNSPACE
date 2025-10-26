import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnsphere/screens/ProgramScreens/ProgramType.dart';
import '../../widgets/colors.dart';
import '../../widgets/learning_card.dart';

class ProgramlistScreen extends StatefulWidget {
  const ProgramlistScreen({super.key});

  @override
  State<ProgramlistScreen> createState() => _ProgramlistScreenState();
}

class _ProgramlistScreenState extends State<ProgramlistScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        // Header title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: const Text(
            'Programs List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 15),

        // Gradient banner
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 15),
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.lightPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Learn Your Favourite Coding \nLanguage in All',
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

        const SizedBox(height: 10),

        // Filters (optional)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              chipText("All"),
              chipText("Popular"),
              chipText("Beginner"),
              chipText("Advanced"),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // 🔥 Firestore Data List
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('programs').snapshots(),
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
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('No programs found.'),
                ),
              );
            }

            final programs = snapshot.data!.docs;

            return Column(
              children: List.generate(programs.length, (index) {
                final program = programs[index].data() as Map<String, dynamic>;

                return LearningCard(
                  name: program['program_name'] ?? 'No name',
                  learners: program['total_learners'] ?? '0',
                  courses: program['total_courses'] ?? '0',
                  articles: '5 articles',
                  logo:
                      program['logo_url'] ??
                      'https://cdn-icons-png.flaticon.com/512/732/732212.png', // fallback image
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Programtype(data: program),
                      ),
                    );
                  },
                );
              }),
            );
          },
        ),
      ],
    );
  }

  Widget chipText(String name) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 226, 230, 234),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
