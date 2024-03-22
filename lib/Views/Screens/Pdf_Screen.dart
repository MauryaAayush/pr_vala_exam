import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pr_vala_exam/Views/Screens/Add_Screen.dart';
import 'package:printing/printing.dart';


class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final pdf = pw.Document();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        // pdfFileName: '${pdf}.pdf',
        build: (format) => GeneratePdf(),
      ),
    );
  }
}
