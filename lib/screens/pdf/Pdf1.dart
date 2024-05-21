import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'InvoiceScreen1.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text('pdf'),),
        body: PdfPreview(
          pdfPreviewPageDecoration: BoxDecoration(color: Colors.white,),
          build: (format) => generatePdf(),
        ),

      );
  }
}

