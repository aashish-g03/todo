import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String> todoItems = [];
List<String> desList = [];
Map<int, bool> important = {0: false};

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
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          final title = todoItems[index];
          final des = desList[index];
          for (int i = 0; i < todoItems.length + 1; i++) {
            if (important[i] != true) important[i] = false;
          }

          return Column(
            children: [
              Text(
                '\n',
                style: TextStyle(fontSize: 5),
              ),
              Container(
                child: ListTile(
                  leading: TextButton(
                    child: Icon(
                      Icons.star,
                      size: 30,
                    ),
                    style: TextButton.styleFrom(
                      primary:
                          important[index] ? Colors.amber : Colors.grey[400],
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(5),
                    ),
                    onPressed: () {
                      setState(() {});
                      important[index] = !important[index];
                      Fluttertoast.showToast(
                        msg: important[index] ? "Marked Important" : "Unmarked",
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  subtitle: Text(
                    des,
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  trailing: TextButton(
                    child: Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(5),
                    ),
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
                  color: Colors.blueAccent[100],
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
