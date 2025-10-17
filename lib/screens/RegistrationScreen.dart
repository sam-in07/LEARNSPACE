import 'package:flutter/material.dart';

class regiscreen extends StatefulWidget {
  const regiscreen({super.key});

  @override
  State<regiscreen> createState() => _regiscreenState();
}

class _regiscreenState extends State<regiscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Column(
           children: [
             Text('Registration Screen'),
           ],
         ),
      ),
    );
  }
}
