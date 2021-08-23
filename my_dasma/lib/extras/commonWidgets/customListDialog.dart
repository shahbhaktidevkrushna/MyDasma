import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListDialog extends StatefulWidget {
  const CustomListDialog({Key? key}) : super(key: key);

  @override
  _CustomListDialogState createState() => _CustomListDialogState();
}

class ItemList {
  String name;
  ItemList({required this.name});
}

class _CustomListDialogState extends State<CustomListDialog> {
  int _counter = 0;
  List<ItemList> exercises = [
    ItemList(name: 'A'),
    ItemList(name: 'B'),
    ItemList(name: 'C'),
    ItemList(name: 'D'),
    ItemList(name: 'E'),
    ItemList(name: 'F'),
    ItemList(name: 'G')
  ];

  late int _selected;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select your country"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        FlatButton(
          child: const Text('CANCEL'),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textColor: Theme.of(context).accentColor,
          onPressed: () {
            //widget.onCancel();
          },
        ),
        FlatButton(
          child: const Text('OK'),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textColor: Theme.of(context).accentColor,
          onPressed: () {
            //widget.onOk();
          },
        ),
      ],
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: exercises.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          title: Text(exercises[index].name),
                          value: index,
                          groupValue: _selected,
                          onChanged: (value) {
                            setState(() {
                              _selected = index;
                            });
                          });
                    }),
              ),
              Divider(),
              TextField(
                autofocus: false,
                maxLines: 1,
                style: TextStyle(fontSize: 18),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "hint",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
