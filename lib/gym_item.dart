import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_content.dart';

class GymItem extends StatefulWidget {

  GymItem({super.key, required this.title,  required this.onDelete});

  final VoidCallback onDelete;
  String title = '';


  @override
  State<GymItem> createState() => GymItemState();
}

class GymItemState extends State<GymItem> {

  Future<void> editTitle() async{
    return showDialog<void>(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Text( "Edit your workout split:",
                style: TextStyle(
                    fontSize: 20.0
                ),
                textAlign: TextAlign.center,
              ),
              content: DialogContent(onSave: (title) => widget.title = title)
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(
          children:[
            Expanded(
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: editTitle,
                    style: IconButton.styleFrom(
                        iconSize: 15
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                    style: IconButton.styleFrom(
                        iconSize: 15
                    ),
                  ),
                ]
            ),
          ]
      );
  }


}