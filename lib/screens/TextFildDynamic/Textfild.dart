import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({super.key});

  @override
  State<TextField> createState() => _TextFieldState();
}


GlobalKey<FormState> formKey = GlobalKey();
// TextEditingController txtSkills = TextEditingController();

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dynamic TextFiled',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            textControllerList.length,
                (index) => ListTile(
              title: TextFormField(
                controller: textControllerList[index],
                decoration: InputDecoration(
                    hintText: 'Skills',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        TextEditingController textController =
                        TextEditingController();
                        textControllerList.add(textController);
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        textControllerList.removeAt(index-1);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // String Skills = textController.text;
          setState(() {
            Skills = '';
            for (int i = 0; i < textControllerList.length; i++) {
              Skills = '$Skills ${ textControllerList[i].text}';
            }
            // print(skills);
            Navigator.of(context).pushNamed('/view');
          }


          );


        },
        child: Icon(Icons.check),
      ),
    );
  }
}









String Skills = ' ';
TextEditingController textController = TextEditingController();
List<TextEditingController> textControllerList = [textController];