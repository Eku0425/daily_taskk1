import 'package:flutter/material.dart';

class RadioCheckScreen extends StatefulWidget {
  const RadioCheckScreen({super.key});

  @override
  State<RadioCheckScreen> createState() => _RadioCheckScreenState();
}

class _RadioCheckScreenState extends State<RadioCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button x Checkbox'),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('Male'),
            value: 'Male', groupValue: gender, onChanged: (value) {
            setState(() {
              gender = value!;
            });
          },),
          RadioListTile(
            title: Text('Female'),
            value: 'Female', groupValue: gender, onChanged: (value) {
            setState(() {
              gender = value!;
            });
          },),
          RadioListTile(
            title: Text('Other'),
            value: 'Other', groupValue: gender, onChanged: (value) {
            setState(() {
              gender = value!;
            });
          },),

          CheckboxListTile(
            title: Text('C Language'),
            value: isCheckForC, onChanged: (value) {
            setState(() {
              isCheckForC = value!;
            });
          },),

          CheckboxListTile(
            title: Text('C++ Language'),
            value: isCheckForCpp, onChanged: (value) {
            setState(() {
              isCheckForCpp = value!;
            });
          },),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String skills = " ";
          if(isCheckForC && isCheckForCpp)
            {
              skills = skills + " " + "C Language C++ Language";
            }
          else if(isCheckForC)
            {
              skills = skills + " " + "C Language";
            }
          else if(isCheckForCpp)
            {
              skills = skills + " " + "C++ Language";
            }


          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$gender $skills')));

        },
        child: Icon(Icons.shower_rounded),
      ),
    );
  }
}


String gender = 'Male';
bool isCheckForC = false;
bool isCheckForCpp = false;