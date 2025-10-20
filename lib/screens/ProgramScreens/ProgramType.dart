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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // app bar
          appBar(),
          Expanded(
            child: ListView(
              children: List.generate(5, (index) {
                return programCard();
              }),
            ),
          ),
          // SizedBox(height: 20),

          // courses
        ],
      ),
    );
  }

  // program card
  Widget programCard() {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (ctx) => Programdetailscreen()));
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
            // logo
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 170,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 49, 24, 74),
                        const Color.fromARGB(255, 69, 47, 122),
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
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.only(
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 3),
                      color: Colors.pink[700],
                      child: Center(
                        child: Text(
                          'Rahul Janghu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // other details
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                spacing: 8.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // chip text
                  Row(spacing: 5, children: [chipText(true), chipText(false)]),

                  // title
                  SizedBox(
                    width: 190,
                    child: Text(
                      'Pyhton Courses For Beginner with Certification',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),

                  Row(
                    spacing: 5.0,
                    children: [
                      iconText('236064 Learners', Icons.person_4_outlined),
                      iconText('14h 46m', Icons.alarm),
                    ],
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      // maximumSize: Size(120, 60),
                      fixedSize: Size(200, 35),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Start Learning',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
        shape: BoxShape.rectangle,
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
              // logo
              Image.asset(
                widget.data['logo'],
                height: 50,
                width: 50,
                color: Colors.grey[400],
              ),

              // title
              Text(
                ' ${widget.data['name']} Hub',
                style: TextStyle(
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
