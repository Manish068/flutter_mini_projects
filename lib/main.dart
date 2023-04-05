import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/infinite_list_view/infinite_list_view_app.dart';

Future<void> main() async{
  try{
    runApp(const InfiniteListViewApp());
  }catch(error){
    print(error.toString());
  }
}

