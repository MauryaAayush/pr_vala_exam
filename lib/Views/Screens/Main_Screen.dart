import 'package:flutter/material.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('second');
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add,color: Colors.white,size: 25,),

      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: Text('Billing',style: TextStyle(
          color: Colors.teal,
          fontSize: 30,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
