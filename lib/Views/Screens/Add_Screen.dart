import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pr_vala_exam/Utils/All_Data.dart';
import 'package:pr_vala_exam/Views/Screens/Add_Screen.dart';
import 'package:printing/printing.dart';

final pdf = pw.Document();

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'All List',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        actions: [
          SizedBox(
            width: 30,
          ),
          InkWell(
            child: Icon(Icons.picture_as_pdf_rounded, size: 30),
            onTap: () async {
              for (int i = 0; i < Product_Price.length; i++) {
                total = total + Product_Price[i];
              }
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => preview(),
                  ));
            },
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => productBox(index),
        itemCount: Product_name.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('second');
        },
      ),
    );
  }

  Widget productBox(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black,width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.teal.shade700,
                blurRadius: 15,
                offset: Offset(0, 5),
                spreadRadius: 0.1
            )
          ],
          borderRadius: BorderRadius.circular(20),),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 80,


                child: ListTile(
                  leading: Text(
                    '${Product_name[index]}',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  title: Text(
                    '${Product_Quantity[index]} Qty',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  trailing: Text(
                    '${Product_Price[index]}/-',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed('four').then((value) {
                  setState(() {});
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  Product_name.removeAt(index);
                  Product_Quantity.removeAt(index);
                  Product_Price.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<Uint8List> GeneratePdf() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Container(
          height: double.infinity,
          width: double.infinity,
          child: pw.Column(
            children: [
              // pw.Container(
              //   height: 50,
              //   width: 500,
              //   decoration: pw.BoxDecoration(
              //       color: PdfColors.teal,
              //       borderRadius: pw.BorderRadius.circular(5)),
              //   child: pw.Center(
              //     child: pw.Text(
              //       "Invoice",
              //       style: const pw.TextStyle(fontSize: 25),
              //     ),
              //   ),
              // ),
              pw.SizedBox(height: 5),
              pw.Container(
                height: 100,
                width: 500,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(width: 2),
                  borderRadius: pw.BorderRadius.circular(15),
                  color: PdfColors.white,
                ),
                child: pw.Column(
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Text("Radhey radhey",
                        style: pw.TextStyle(
                            fontSize: 30, fontWeight: pw.FontWeight.bold)),
                    pw.Center(
                      child: pw.Text(
                        "Home of town",
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "Mob No:- 8604949240",
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Container(
                width: 500,
                height: 550,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                    width: 2,
                    color: PdfColors.red,
                  ),
                  borderRadius: pw.BorderRadius.circular(20),
                ),
                child: pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Column(
                    children: [
                      pw.Container(
                        height: 200,
                        width: 450,
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            width: 1.5,
                            color: PdfColors.red,
                          ),
                          borderRadius: pw.BorderRadius.circular(20),
                        ),
                        child: pw.Column(
                          children: [
                            pw.ListView.builder(
                                itemBuilder: (context, index) => pw.Container(
                                  height: 20,
                                  width: double.infinity,
                                  padding:  pw.EdgeInsets.all(10),
                                  margin:  pw.EdgeInsets.all(10),
                                  child:



                                  pw.Row(
                                      mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceEvenly,
                                      children: [
                                        pw.Text(
                                          '${index + 1}',
                                          style:  pw.TextStyle(
                                              fontSize: 17),
                                        ),
                                        pw.Text(
                                          '${Product_name[index]}',
                                          style:  pw.TextStyle(
                                              fontSize: 17),
                                        ),
                                        pw.Text(
                                          '${Product_Quantity[index]}',
                                          style:  pw.TextStyle(
                                              fontSize: 17),
                                        ),
                                        pw.Text(
                                          '${Product_Price[index]}',
                                          style:  pw.TextStyle(
                                              fontSize: 17),
                                        ),
                                      ]),
                                ),
                                itemCount: Product_name.length),

                            pw.SizedBox(height: 20),

                            pw.Text(
                                'Total:- ${total }',
                                style: pw.TextStyle(fontSize: 20)),
                            pw.Text(
                                'With GST:- ${gst()}',
                                style: pw.TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 40),
                      // pw.Container(
                      //   height: 50,
                      //   width: 430,
                      //   color: PdfColors.teal,
                      //   child: pw.Row(
                      //     mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       pw.Text("Generic payment instructions here.",
                      //           style: pw.TextStyle(
                      //               fontSize: 10,
                      //               fontWeight: pw.FontWeight.bold)),
                      //       pw.Text("Optional banking details here.",
                      //           style: pw.TextStyle(
                      //               fontSize: 10,
                      //               fontWeight: pw.FontWeight.bold)),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ),
  );

  PdfPreview(
    build: (format) => pdf.save(),
  );
  return pdf.save();
}

class preview extends StatefulWidget {
  const preview({super.key});

  @override
  State<preview> createState() => _previewState();
}

class _previewState extends State<preview> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => GeneratePdf(),
    );
  }
}


double gst()
{
  double gsttotal =  total * 18 /100;

  double finalprice = gsttotal + total;

  return finalprice;
}