import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/details_screen.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.3,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 231, 220, 254),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.02, bottom: screenHeight * 0.09),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/person.jpg'),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Haider Rehman',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, top: screenHeight * 0.18),
                  child: Container(
                    height: screenHeight * 0.20,
                    width: screenWidth * 0.90,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 253, 233, 233)),
                        color: const Color.fromARGB(255, 249, 125, 1)
                            .withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/deco.png',
                          height: screenHeight * 0.12,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.05, left: 20),
                              child: Text(
                                'Play \$ Win',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 254, 253, 253),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Play Quiz by',
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 118, 47, 0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'guessing the pictures',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 252, 252, 252),
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02),
              child: Row(
                children: [
                  Text(
                    'Top Quiz categories',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              category: 'Vegetables',
                            ),
                          ));
                    },
                    child: const QuizCard(
                        imgPath: 'assets/images/vegetables.png',
                        text: 'Vegetables'),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(category: 'Places'),
                            ));
                      },
                      child: const QuizCard(
                          imgPath: 'assets/images/tower.png', text: 'Places')),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(category: 'Animals'),
                          ));
                    },
                    child: const QuizCard(
                        imgPath: 'assets/images/animals.png', text: 'Animals'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(category: 'Objects'),
                          ));
                    },
                    child: const QuizCard(
                        imgPath: 'assets/images/objects.png', text: 'Objects'),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(category: 'Sports'),
                            ));
                      },
                      child: const QuizCard(
                          imgPath: 'assets/images/sports.png', text: 'Sports')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(category: 'Random'),
                            ));
                      },
                      child: const QuizCard(
                          imgPath: 'assets/images/random.png', text: 'Random')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
