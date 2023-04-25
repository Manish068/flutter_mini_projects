import 'package:flutter/material.dart';

class ExpandableListItemApp extends StatelessWidget {
  const ExpandableListItemApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expandable List App"),
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
  final basicTile = <BasicTile>[
    BasicTile(title: "Fruits", tileList: [
      BasicTile(title: "Apple"),
      BasicTile(title: "Orange"),
      BasicTile(title: "Papaya"),
      BasicTile(title: "Mango"),
    ]),
    BasicTile(title: "Country", tileList: [
      BasicTile(title: "India"),
      BasicTile(title: "America"),
      BasicTile(title: "Sri Lanka"),
      BasicTile(title: "Pakistan"),
    ]),
    BasicTile(title: "Car Brand", tileList: [
      BasicTile(title: "Toyota"),
      BasicTile(title: "Hyundai"),
      BasicTile(title: "MarutiSuzuki"),
      BasicTile(title: "Porche"),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: basicTile.map(buildTile).toList(),
    );
  }

  Widget buildTile(BasicTile tile) {
    return ExpansionTile(
      title: Text(tile.title),
      children: tile.tileList.map((tile) => buildTile(tile)).toList(),
    );
  }
}

class BasicTile {
  final String title;
  final List<BasicTile> tileList;

  BasicTile({required this.title, this.tileList = const []});
}
