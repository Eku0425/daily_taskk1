import 'package:flutter/material.dart';
import 'dart:typed_data';


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Screen'),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/pdf');
            },
            child: Icon(Icons.picture_as_pdf),
          )
        ],
      ),
      body: Column(
        children: [
          ...List.generate(
              invoiceList.length,
                  (index) => ListTile(
                title: Text(invoiceList[index].name!,style: TextStyle(fontSize: 25),),
                subtitle: Text(invoiceList[index].price!,style: TextStyle(fontSize: 25)),
                trailing: Text(invoiceList[index].category!,style: TextStyle(fontSize: 25)),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
                () {
              invoiceList.add(InvoiceModel(
                  name: 'iphone', price: '50,000', category: 'phone'));
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

List<InvoiceModel> invoiceList = [
  InvoiceModel(name: 'HP', price: '55000', category: 'laptop'),
  InvoiceModel(name: 'iphone', price: '55000', category: 'phone'),
  InvoiceModel(name: 'samsung', price: '25,000', category: 'phone'),
  InvoiceModel(name: 'HP', price: '13,000', category: 'laptop'),
  InvoiceModel(name: 'HP', price: '120000', category: 'laptop'),
];

class InvoiceModel {
  String? name;
  String? price;
  String? category;

  InvoiceModel({this.name, this.price, this.category});

}
Future<Uint8List> generatePdf() {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Row(children: [
        pw.SizedBox(
            height: 25
        ),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: List.generate(
            invoiceList.length,
                (index) => pw.Text(
              '${invoiceList[index].name} ',
              style: pw.TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        pw.SizedBox(width: 90),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              invoiceList.length,
                  (index) => pw.Text(
                '${invoiceList[index].price}',
                style: pw.TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
        pw.SizedBox(
          width: 90,
        ),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              invoiceList.length,
                  (index) => pw.Text(
                '${invoiceList[index].category}',
                style: pw.TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ]),
    ),

  );
  return pdf.save();


}



