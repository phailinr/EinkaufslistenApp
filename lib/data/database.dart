import 'package:hive/hive.dart';

class ShoppingDatabase{
  List itemList = [];

  final _myBox = Hive.box('myBox');

  void createInitialData(){
    itemList=[
      ["Bread", false],
      ["Milk", false]
    ];
  }

  void loadData(){
    itemList = _myBox.get("ITEMLIST");
  }

  void updateData(){
    _myBox.put("ITEMLIST", itemList);
  }
}