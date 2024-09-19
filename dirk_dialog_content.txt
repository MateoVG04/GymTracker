import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {

  final void Function(String) onSave;

  String value = '';
  DialogContent({super.key, value, required this.onSave});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          TextField(
            onChanged: (value) {
              value = value;
            },
            decoration: const InputDecoration(
                hintText: "split name",
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromRGBO(215, 215, 215, 1.0),
                ),
                filled: true,
                fillColor: Color.fromRGBO(240, 240, 240, 1.0)
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 16.0)
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                TextButton(
                  child: const Text(
                    "close",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    "save",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  onPressed: (){
                      if(value!="") {

                        onSave(value);
                      }

                    Navigator.of(context).pop();
                  },
                )
              ]
          )
        ]
    );
    }
  }