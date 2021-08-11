import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './display.dart';

class AddItem extends StatefulWidget {
  @override
  AddItemState createState() => AddItemState();
}

void addItem(final a, final b) {
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
        msg: title.text.length == 0 ? "Invalid Input" : "${title.text} added",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      if (title.text.length > 0) addItem(title.text, description.text);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(19),
            child: Text(
              'ADD A TODO TASK',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.batch_prediction_rounded,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 26),
            child: TextFormField(
              controller: title,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'TO-DO TITLE',
              ),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 26),
            child: TextFormField(
              controller: description,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'DESCRIPTION',
              ),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(25),
            child: ElevatedButton(
              onPressed: () {
                buttonPressed();
                setState(() {});
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                  primary: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
