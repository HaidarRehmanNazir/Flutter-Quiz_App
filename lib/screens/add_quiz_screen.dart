import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/services/database.dart';
import 'package:random_string/random_string.dart';

class AddQuizScren extends StatefulWidget {
  const AddQuizScren({super.key});

  @override
  State<AddQuizScren> createState() => _AddQuizScrenState();
}

class _AddQuizScrenState extends State<AddQuizScren> {
  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctcontroller = new TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        option1controller.text != "" &&
        option2controller.text != "" &&
        option3controller.text != "" &&
        option4controller.text != "") {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogimage").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addQuiz = {
        "image": downloadUrl,
        "option1": option1controller.text,
        "option2": option2controller.text,
        "option3": option3controller.text,
        "option4": option4controller.text,
        "correct": correctcontroller.text,
      };
      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              'Quiz has been added successfully',
              style: TextStyle(
                fontSize: 18,
              ),
            )));
      });
    }
  }

  String? value;
  final List<String> quiztems = [
    'Animals',
    'Sports',
    'Vegetables',
    'Random',
    'Objects',
    'Places'
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Quiz',
                      style: GoogleFonts.poppins(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 78, 77, 77)),
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              height: screenHeight * 0.13,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 246, 246)),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Upload the Quiz picture',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  selectedImage == null
                      ? GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Container(
                            child: IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: Icon(Icons.camera)),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        )
                      : Container(
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Option 1',
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: option1controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 244, 252, 252),
                        hintText: 'Enter Option 1',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Option 2',
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: option2controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 244, 252, 252),
                        hintText: 'Enter Option 2',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Option 3',
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: option3controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 244, 252, 252),
                        hintText: 'Enter Option 3',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Option 4',
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: option4controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 244, 252, 252),
                        hintText: 'Enter Option 4',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Correct Answer',
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: correctcontroller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 244, 252, 252),
                        hintText: 'Enter Correct Answer',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        items: quiztems
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                )))
                            .toList(),
                        onChanged: ((value) => setState(() {
                              this.value = value;
                            })),
                        dropdownColor: Colors.white,
                        hint: Text('Enter Categories'),
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        value: value,
                      )),
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                      color: const Color.fromARGB(255, 244, 252, 252),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadItem();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 122, 176, 176),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                          },
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
