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
    if (todoItems.isEmpty) {
      return const Align(
        child: Text(
          'NO TO-DO ITEMS',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
              const Text(
                '\n',
                style: TextStyle(fontSize: 5),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      primary:
                          important[index] ? Colors.amber : Colors.grey[400],
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5),
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
                    child: const Icon(
                      Icons.star,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  subtitle: Text(
                    des,
                    style: const TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(5),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          todoItems.remove(title);
                          desList.remove(des);
                        },
                      );
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
