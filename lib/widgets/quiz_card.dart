import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCard extends StatelessWidget {
  final String imgPath;
  final String text;
  const QuizCard({super.key, required this.imgPath, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            imgPath,
            height: screenHeight * 0.08,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      height: screenHeight * 0.19,
      width: screenWidth * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
