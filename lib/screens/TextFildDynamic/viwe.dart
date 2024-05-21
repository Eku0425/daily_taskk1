import 'package:flutter/material.dart';

import 'Textfild.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Skills Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        leading: InkWell(
          onTap: () {
            setState(() {
              Navigator.of(context).pop('/');
            });
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Text('$Skills\n',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)
        ],
      ),
    );
  }
}



