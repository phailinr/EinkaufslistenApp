import 'package:flutter/material.dart';
import 'package:shoppingapp/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[200],
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Notiere auf den Einkaufszettel" 
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Button(text: "Speichern", onPressed: onSave),
            const SizedBox(width: 4,),
            Button(text: "Abbrechen", onPressed: onCancel)

          ],)

        ],),
      ),
    );
  }
}