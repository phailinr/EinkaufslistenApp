import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShoppingTile extends StatelessWidget {
  final String itemName;
  final bool itemCheck;
  Function(bool?)? onChanged; 
  Function(BuildContext) deleteFunction;

  ShoppingTile({super.key, required this.itemName, required this.itemCheck, required this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: itemCheck, 
                onChanged: onChanged,
                activeColor: Colors.blueGrey,),
      
              //task name
              Text(
                itemName,
                style: TextStyle(
                  decoration: itemCheck
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),)
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 244, 255),
            borderRadius: BorderRadius.circular(10),
            ),
          
      
        ),
      ),
      
    );
  }
}