import 'package:flutter/material.dart';

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
      return Container(
        child: Text(
          'NO TO DO ITEMS',
        ),
      );
    bool checked = false;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          final title = todoItems[index];
          final des = desList[index];
          return Container(
            child: ListTile(
              leading: FlatButton(
                child: Icon(
                  Icons.check,
                  size: 30,
                  color: checked ? Colors.green : Colors.grey,
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
              ),
              subtitle: Text(des),
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }
}
