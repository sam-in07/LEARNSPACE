import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final firebaseInstance = FirebaseFirestore.instance;

  // add programs
  void addCourseToPython() async {
    try {
      final res = await firebaseInstance
          .collection('course_list')
          .doc('sql')
          .collection('courses')
          .add({
            "title": "Sql v/s NoSql",
            "instructor_details": [
              {
                "name": "Mohit Yadav",
                "rating": "5",
                "total_courses": "1",
                "about": "Instructor @ Scaler Academy",
              },
            ],
            "description": "SQL v/s NoSql",
            "total_hours": "10h 14m",
            "modules": [
              {
                "module_name": "SQL v/s NoSql",
                "total_hours": "48m",
                "chapters": "3 chapters",
                "topics": [
                  "Introduction to python for Beginners",
                  "Content of Python Course",
                  "Pre-requisite for Python",
                ],
              },
              // {
              //   "module_name": "Querying Single Table",
              //   "total_hours": "4m",
              //   "chapters": "1 chapters",
              //   "topics": ["Setting up Anaconda"],
              // },
              // {
              //   "module_name": "Querying Multiple Table",
              //   "total_hours": "41m",
              //   "chapters": "7 chapters",
              //   "topics": [
              //     "Print Hello World",
              //     "Variables",
              //     "Stack & Heap Memory",
              //     "Id function",
              //     "Python comments",
              //     "Data Types in Python",
              //     "Input function in Python",
              //   ],
              // },
              // {
              //   "module_name": "Data Agregation and Summarization",
              //   "total_hours": "12m",
              //   "chapters": "5 chapters",
              //   "topics": [
              //     "Printing Multiple Values",
              //     "Default Sep & End in Print",
              //     "Changing default separator end in Print",
              //     "Changing default end in Print ",
              //     "Challenge 4 - Print function",
              //   ],
              // },
              // {
              //   "module_name": "SubQueries / Complex Queries",
              //   "total_hours": "39m",
              //   "chapters": "9 chapters",
              //   "topics": [
              //     "Intro to Python Operators",
              //     "Arithmetic Operators",
              //     "Arithmetic Operator Continued",
              //     "Cmparison Operators",
              //     "Assignment Operators",
              //     "Logical and Operator",
              //     "Logical or & not Operator",
              //     "Special Operator",
              //     "Challend 5 - Python Operator Expertise",
              //   ],
              // },
              // {
              //   "module_name": "Functional Programming",
              //   "total_hours": "37m",
              //   "chapters": "7 chapters",
              //   "topics": [
              //     "Control Flow Introduction",
              //     "Syntax of If Else",
              //     "If elif & else",
              //     "Challenge : print largest",
              //     "challenge: Grading System",
              //     "Challenge 6- Control Flow",
              //   ],
              // },
              // {
              //   "module_name": "Object Oriented JavaScript",
              //   "total_hours": "53m",
              //   "chapters": "5 chapters",
              //   "topics": [
              //     "Into to Python Loops",
              //     "While Loop",
              //     "Print numbers using Python loop",
              //     "print even Number in Given Range",
              //     "Range Function",
              //   ],
              // },
              // {
              //   "module_name": "Asynchronous JavaScript",
              //   "total_hours": "53m",
              //   "chapters": "7 chapters",
              //   "topics": [
              //     "Strings in Python",
              //     "ord and chr in Python",
              //     "Indexing in String",
              //     "Accessing a character in String",
              //     "String Slicing",
              //     "String Methods part1",
              //     "String Methods part2",
              //   ],
              // },
              // {
              //   "module_name": "Miscellaneous Topics",
              //   "total_hours": "1h 3m",
              //   "chapters": "5 chapters",
              //   "topics": [
              //     "Strings in Python",
              //     "ord and chr in Python",
              //     "Indexing in String",
              //     "Accessing a character in String",
              //     "String Slicing",
              //   ],
              // },
              
            ],
          });

      // print('res : $res');

      print("✅ Course added to data structures!");
    } catch (e) {
      print("❌ Error adding course: $e");
    }
  }

  // get course
  void fetchPythonCourses() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('course_list')
        .doc('python')
        .collection('courses')
        .get();

    for (var doc in snapshot.docs) {
      print('Course Title: ${doc['title']}');
      print('Instructor: ${doc['instructor_details'][0]['name']}');
      print('doc: ${doc['modules']}');
    }
  }

  void addPrograms() async {
    // try {
    //   // Add the "Data Structures" program
    //   await firebaseInstance.collection('programs').doc('sql').set({
    //     "program_name": "SQL",
    //     "total_courses": "3",
    //     "total_learners": "22k",
    //     "logo_url": "assets/images/program_images/sql.png"
    //   });
    //   await firebaseInstance.collection('programs').doc('html').set({
    //     "program_name": "HTML",
    //     "total_courses": "",
    //     "total_learners": "19k",
    //     "logo_url": "assets/images/program_images/html.png"
    //   });
    //    await firebaseInstance.collection('programs').doc('software_engineering').set({
    //     "program_name": "Softwar Eengineering",
    //     "total_courses": "1",
    //     "total_learners": "14k",
    //     "logo_url": "assets/images/program_images/softwareengineering.png"
    //   });
    //    await firebaseInstance.collection('programs').doc('react').set({
    //     "program_name": "React",
    //     "total_courses": "",
    //     "total_learners": "10k",
    //     "logo_url": "assets/images/program_images/react.png"
    //   });
    //   await firebaseInstance.collection('programs').doc('css').set({
    //     "program_name": "CSS",
    //     "total_courses": "1",
    //     "total_learners": "9k",
    //     "logo_url": "assets/images/program_images/css.png"
    //   });

    //   // Fetch all programs
      
    // } catch (e) {
    //   print('🔥 Error: $e');
    // }

    final snapshot = await firebaseInstance.collection('programs').get();

      // Loop through all program documents
      for (var doc in snapshot.docs) {
        print('Program ID: ${doc.id}');
        print('Program Name: ${doc['program_name']}');
        print('Total Courses: ${doc['total_courses']}');
        print('Total Learners: ${doc['total_learners']}');
         print('Logo: ${doc['logo_url']}');
        print('--------------------------');
      }
  }

  void updateLogoUrls() async {
  final firebaseInstance = FirebaseFirestore.instance;

  try {
    // Example: update individual docs with their own logo URL
    await firebaseInstance.collection('programs').doc('python').update({
      'logo_url': 'assets/images/program_images/python.png',
    });

    await firebaseInstance.collection('programs').doc('c_program').update({
      'logo_url': 'assets/images/program_images/c.png',
    });

    await firebaseInstance.collection('programs').doc('dbms').update({
      'logo_url': 'assets/images/program_images/server.png',
    });

    await firebaseInstance.collection('programs').doc('data_structures').update({
      'logo_url': 'assets/images/program_images/datastructure.png',
    });

    print('✅ Logo URLs added successfully!');
  } catch (e) {
    print('🔥 Error updating logo URLs: $e');
  }
}
}



