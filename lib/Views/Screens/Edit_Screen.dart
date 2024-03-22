import 'package:flutter/material.dart';
import 'package:pr_vala_exam/Utils/All_Data.dart';

class Edits_Screen extends StatefulWidget {
  const Edits_Screen({super.key});

  @override
  State<Edits_Screen> createState() => _Edits_ScreenState();
}

int index = 0;

class _Edits_ScreenState extends State<Edits_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Re-Enter product',
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: TextEditingController(text: Product_name[index]),
              decoration: InputDecoration(
                  labelText: 'Product Name', labelStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                Product_name[index] = value;
              },
            ),
            TextField(
              controller: TextEditingController(
                  text: Product_Quantity[index].toString()),
              decoration: InputDecoration(labelText: 'Quantity',labelStyle: TextStyle()),
              // keyboardType: TextInputType.number,
              onChanged: (value) {
                Product_Quantity[index] = int.tryParse(value) ?? 0;
              },
            ),
            TextField(
              controller:
                  TextEditingController(text: Product_Price[index].toString()),
              decoration: InputDecoration(labelText: 'Amount'),
              // keyboardType: TextInputType.number,
              onChanged: (value) {
                Product_Price[index] = int.tryParse(value) ?? 0;
              },
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {});
                    // Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
