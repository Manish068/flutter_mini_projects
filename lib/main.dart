import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/ExpandableListItem/expandable_list_item_app.dart';
import 'package:flutter_mini_projects/infinite_list_view/infinite_list_view_app.dart';

Future<void> main() async{
  try{
    runApp(const ExpandableListItemApp());
  }catch(error){
    print(error.toString());
  }
}

