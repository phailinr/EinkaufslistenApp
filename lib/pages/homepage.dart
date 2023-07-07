import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoppingapp/data/database.dart';
import 'package:shoppingapp/util/dialogBox.dart';
import 'package:shoppingapp/util/shoppingTile.dart';
import 'package:vibration/vibration.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  final _myBox = Hive.box('myBox');
  ShoppingDatabase db= ShoppingDatabase();

  @override
  void initState() {
    if(_myBox.get("ITEMLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }


  //text controller
  final _controller = TextEditingController();

  //checkbox clicked
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.itemList[index][1] = !db.itemList[index][1];
      
    });
    
    db.updateData();
  }

  //save new item
  void saveNewItem(){
    setState(() {
      db.itemList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //create new item
  void createNewItem(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewItem,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );

  }

  //delete item
  void deleteItem(int index){
    setState(() {
      db.itemList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Einkaufsliste'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.itemList.length,
        itemBuilder: (context, index){
          return ShoppingTile(
            itemName: db.itemList[index][0], 
            itemCheck: db.itemList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteItem,
            );
      
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewItem,
        child: Icon(Icons.add),
        ),
      backgroundColor: const Color.fromARGB(255, 158, 190, 206),
    );
  }
  
}
