import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/services/database.dart';

class DetailScreen extends StatefulWidget {
  String category;
  DetailScreen({required this.category});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool show = false;
  getontheload() async {
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: QuizStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                  controller: controller,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      width: double.infinity,
                      height: 740,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 255, 255),
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.0092),
                          Container(
                              height: screenHeight * 0.34,
                              width: screenWidth * 0.92,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  ds['image'],
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(height: screenHeight * 0.02),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option1'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      color: ds['correct'] == ds['option1']
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  )
                                : Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option1'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option2'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      color: ds['correct'] == ds['option2']
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  )
                                : Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option2'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option3'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      color: ds['correct'] == ds['option3']
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  )
                                : Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option3'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option4'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      color: ds['correct'] == ds['option4']
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  )
                                : Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ds['option4'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: screenHeight * 0.06,
                                    width: screenWidth * 0.92,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                  ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 35,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 229, 228, 220),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          show = false;
                                        });
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.easeIn);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 220, 254),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.02, top: screenHeight * 0.08),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.2,
                  ),
                  child: Text(
                    widget.category,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(child: allQuiz()),
        ],
      ),
    );
  }
}
