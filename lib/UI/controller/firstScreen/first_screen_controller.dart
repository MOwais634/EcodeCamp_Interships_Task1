

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreenController extends GetxController{
       RxList<String> test = <String>[].obs;
      RxList <String> check = <String>[].obs;
      TextEditingController enterTask = TextEditingController();

List<int>  numbers = [1, 2, 3];
 @override 
  void onReady() {
    loadSavedList();
    super.onReady();
 }

  // Function to save the list
  Future<void> saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('nameList', test);
        await prefs.setStringList('checklist', check);

    
  }

   Future<void> loadSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
      test.value = prefs.getStringList('nameList')??[];
      check.value = prefs.getStringList('checklist')?? [];

  }

}

class Item {
  String name;
  bool isChecked;

  Item({required this.name, this.isChecked = false});
}