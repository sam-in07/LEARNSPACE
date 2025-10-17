import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this line

class AppTextstyle {
  static const textStyle12BlackW500 = TextStyle(
    color: Colors.black, // Now Colors.white will be recognized
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  /*  static const textStyle12WhiteW500 = TextStyle(
    color: Colors.white ,// Now Colors.white will be recognized
    fontSize : 12,
    fontFamily: 'Poppins',
    fontWeight : FontWeight.w500,
  ); */
  static TextStyle textStyle12WhiteW500 = GoogleFonts.inter(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle52WhiteW700 = GoogleFonts.raleway(
    fontSize: 52,
    color: Color(0xff202020),
    fontWeight: FontWeight.w700,
  );
  static TextStyle textStyle19WhiteW300 = GoogleFonts.nunitoSans(
    fontSize: 19,
    color: Color(0xff202020),
    fontWeight: FontWeight.w300,
  );
  static TextStyle textStyle22WideW300 = GoogleFonts.nunitoSans(
    fontSize: 22,
    color: Color(0xfff3f3f3),
    fontWeight: FontWeight.w300,
  );
  static TextStyle textStyle22orrageW300 = GoogleFonts.jacquesFrancois(
    fontSize: 16,
    color: Color(0xffd1610c),
    fontWeight: FontWeight.w300,
  );

  // Correct
  static TextStyle textStyle16blackW400 = GoogleFonts.jacquesFrancois(
    fontSize: 16,
    color: Color(0xFF302025),
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle24whiteW400 = GoogleFonts.inder(
    fontSize: 24,
    color: Color(0xfff3f3f3),
    fontWeight: FontWeight.w400,
  );
}
