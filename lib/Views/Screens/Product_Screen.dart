import 'package:flutter/material.dart';

import '../../Utils/All_Data.dart';

class Product_Screen extends StatefulWidget {
  const Product_Screen({super.key});

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

TextEditingController txtname = TextEditingController();
TextEditingController txtproduct = TextEditingController();
TextEditingController txtquantity = TextEditingController();
TextEditingController txtprice = TextEditingController();

class _Product_ScreenState extends State<Product_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: Text(
          'Invoice Generation',
          style: TextStyle(
              color: Colors.teal, fontSize: 30, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            buildTextFormField(txtname, Icon(Icons.person), 'Customer name'),
            buildTextFormField(txtproduct, Icon(Icons.shopping_cart), 'Product name'),
            buildTextFormField(txtquantity, Icon(Icons.add), 'Quantity'),
            buildTextFormField(txtprice, Icon(Icons.currency_rupee), 'Price'),
            SizedBox(
              height: 150,
            ),


            InkWell(
              onTap: () {

                setState(() {
                  int finalprice = int.parse(txtquantity.text) * int.parse(txtprice.text);
                  Product_name.add(txtproduct.text);
                  Product_Price.add(finalprice);
                  Product_Quantity.add(txtquantity.text);
                });
                Navigator.of(context).pushNamed('third');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      TextEditingController name, Icon i1, String label) {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
          prefixIcon: i1,
          labelText: label,
          labelStyle: TextStyle(color: Colors.white)),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    );
  }
}
