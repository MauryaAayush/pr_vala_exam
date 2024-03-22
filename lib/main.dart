import 'package:flutter/material.dart';
import 'package:pr_vala_exam/Views/Screens/Pdf_Screen.dart';
import 'Views/Screens/Add_Screen.dart';
import 'Views/Screens/Edit_Screen.dart';
import 'Views/Screens/Main_Screen.dart';
import 'Views/Screens/Product_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
     initialRoute: '/',
     routes: {
        '/' : (context) => Main_Screen(),
       'second' : (context) => Product_Screen(),
       'third' : (context) => Add_Screen(),
       'four' : (context) => Edits_Screen(),
       'pdf' : (context) => PdfScreen(),

     },
    );
  }
}


