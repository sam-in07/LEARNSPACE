import 'package:flutter/material.dart';
import 'package:learnsphere/widgets/colors.dart';

class ProgramCard extends StatefulWidget {
  const ProgramCard({
    super.key,
    required this.title,
    required this.author,
    required this.isRegistered,
  });

  final String title;
  final String author;
  final bool isRegistered;
  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.33,
      width: size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.5, color: Colors.grey.shade200),
        // color: Colors.green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 8.0,
        children: [
          // image of the program
          Stack(
            children: [
              // image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                child: Container(
                  height: size.height * 0.31 / 1.8,

                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/program.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // name
              Positioned(
                right: 0,
                bottom: 0,
                child: ClipPath(
                  clipper: LeftSlantClipper(),
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 3),
                    color: Colors.pink[700],
                    child: Text(
                      '           ${widget.author}      ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // details of the program
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: chipText(widget.isRegistered),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              spacing: 20.0,
              children: [
                iconText('23 Oct', Icons.calendar_month),
                iconText('19:30-22:30', Icons.timer),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(height: 1.5, color: Colors.grey[300]),
          ),

          // button view details, join now
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'View Details',
                  style: TextStyle(
                    color: AppColors.appButtonColor,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              joinRegister(widget.isRegistered),
              SizedBox(width: 15.0),
            ],
          ),
          SizedBox(height: 10),
        ],
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
    final text = (isRegistered) ? '✅ Registered' : '📈 331 People Registered';
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

  Widget joinRegister(bool isRegistered) {
    final text = (isRegistered) ? 'Join Now' : 'Registere Now';
    final chipColor = (isRegistered) ? AppColors.appButtonColor : Colors.red;
    final chipTextColor = Colors.white;
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
}

class LeftSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start slightly in from the top-left to create the slant
    path.moveTo(20, 2); // 👈 slanted point (change 30 to control angle)
    path.lineTo(size.width, 0); // top-right
    path.lineTo(size.width, size.height); // bottom-right
    path.lineTo(0, size.height); // bottom-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
