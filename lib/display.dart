import 'package:flutter/material.dart';
import 'dart:math';

List<String> todoItems = [];
List<String> desList = [];

class DisplayItem extends StatefulWidget {
  @override
  DisplayItemState createState() => DisplayItemState();
}

class DisplayItemState extends State<DisplayItem> {
  @override
  Widget build(BuildContext context) {
    if (todoItems.length == 0)
      return Align(
        alignment: Alignment.center,
        child: Text(
          'NO TO-DO ITEMS',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    var checked = false;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          final title = todoItems[index];
          final des = desList[index];
          return Column(
            children: [
              Text(
                '\n',
                style: TextStyle(fontSize: 5),
              ),
              Container(
                child: ListTile(
                  leading: FlatButton(
                    child: Icon(
                      (checked) ? Icons.check_box_rounded : Icons.circle,
                      size: 30,
                    ),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    onPressed: () {
                      setState(() {
                        checked = !checked;
                      });
                    },
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        decoration: (checked)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  subtitle: Text(
                    des,
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  trailing: FlatButton(
                    child: Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    onPressed: () {
                      setState(
                        () {
                          todoItems.remove(title);
                          desList.remove(des);
                        },
                      );
                    },
                  ),
                ),
                decoration: new BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
