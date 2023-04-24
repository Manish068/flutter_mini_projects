import 'package:flutter/material.dart';

class ExpandableListItemApp extends StatelessWidget {
  const ExpandableListItemApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Infinite List View"),
        ),
        body: const ExpandableListItem(),
      ),
    );
  }
}


class ExpandableListItem extends StatefulWidget {
  const ExpandableListItem({Key? key}) : super(key: key);

  @override
  State<ExpandableListItem> createState() => _ExpandableListItemState();
}

class _ExpandableListItemState extends State<ExpandableListItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
