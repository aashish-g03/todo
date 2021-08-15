import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './display.dart';

class AddItem extends StatefulWidget {
  @override
  AddItemState createState() => AddItemState();
}

// ignore: type_annotate_public_apis
void addItem(String a, String b) {
  todoItems.add(a);
  desList.add(b);
}

class AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final description = TextEditingController();
    void buttonPressed() {
      Fluttertoast.showToast(
        msg: title.text.isEmpty ? "Invalid Input" : "${title.text} added",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      if (title.text.isNotEmpty) addItem(title.text, description.text);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(19),
            child: Text(
              'ADD A TODO TASK',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.batch_prediction_rounded,
              size: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 26),
            child: TextFormField(
              controller: title,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'TO-DO TITLE',
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 26),
            child: TextFormField(
              controller: description,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'DESCRIPTION',
              ),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(25),
            child: ElevatedButton(
              onPressed: () {
                buttonPressed();
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  primary: Colors.black),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
