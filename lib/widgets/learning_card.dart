import 'package:flutter/material.dart';

import 'colors.dart';

class LearningCard extends StatefulWidget {
  const LearningCard({
    super.key,
    required this.name,
    required this.learners,
    required this.courses,
    required this.articles,
    required this.logo,
    required this.onClick,
  });

  final String name;
  final String learners;
  final String courses;
  final String articles;
  final String logo;
  final VoidCallback onClick;

  @override
  State<LearningCard> createState() => _LearningCardState();
}

class _LearningCardState extends State<LearningCard> {
  final TextStyle subtitleStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.grey[400],
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        // padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 15, top: 10, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: 0.8, color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            // logo
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.lightPurple],
                  begin: AlignmentGeometry.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 40,
                  child: Image.asset(
                    widget.logo,
                    color: (widget.name != 'DBMS') ? Colors.grey[300] : null,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // name and courses
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 15),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('${widget.learners} | ', style: subtitleStyle),
                      Text('${widget.courses} | ', style: subtitleStyle),
                      Text('${widget.articles} | ', style: subtitleStyle),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
