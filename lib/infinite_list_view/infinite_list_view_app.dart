import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class InfiniteListViewApp extends StatelessWidget {
  const InfiniteListViewApp({Key? key}) : super(key: key);

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
        body: const ListViewMainPage(),
      ),
    );
  }
}

class ListViewMainPage extends StatefulWidget {
  const ListViewMainPage({Key? key}) : super(key: key);

  @override
  State<ListViewMainPage> createState() => _ListViewMainPageState();
}

class _ListViewMainPageState extends State<ListViewMainPage> {
  //first initialize list items empty
  List<String> listItem = [];
  //initialize scrollController to manage functionality of scrolling
  final ScrollController _scrollController = ScrollController();
  // initialize page with 1
  int page =1;

  //to check if there is more data to fetch
  bool hasMore =true;

  // to check if response is taking time its in loading state
  bool isLoading =false;
  @override
  void initState() {
    fetch();

    _scrollController.addListener(() {
      if(_scrollController.position.maxScrollExtent == _scrollController.offset){
        fetch();
      }
    });
    super.initState();
  }

  Future fetch() async{
    //if isLoading is true then we return this function
    if(isLoading) return;

    //else make isLoading true
    // so that we can only hit the api once not multiple time simultaneously
    isLoading=true;

    // limit will be constant for each list of data from url
    const int limit =23;
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page");
    final response = await get(url);

    //if success
    if (response.statusCode == 200) {
      final List list = json.decode(response.body);

      setState(() {
        //increment page
        page++;
        //make is Loading false
        isLoading = false;
        //check if list length is less then limit then there is no data to fetch from api
        // then show no data to fetch at end index instead of progress bar
        if(list.length<limit){
          hasMore=false;
        }

        // add list of items in string type
        listItem.addAll(list.map((item) => "item ${item['id']}").toList());
      });
    }

  }

  @override
  void dispose() {
    //dispose the controller if we don't use
    _scrollController.dispose();
    super.dispose();
  }

  Future _onRefresh() async{
    // refresh the data
     setState(() {
       hasMore = true;
       page=0;
       isLoading = false;
       listItem.clear();
     });
     fetch();
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:  _onRefresh,
      child: ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(10),
          itemCount: listItem.length + 1,
          itemBuilder: (context, index) {
            return index < listItem.length
                ? ListTile(
                    title: Text(listItem[index]),
                  )
                :  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: hasMore ? const Center(child: CircularProgressIndicator()) : const Center(child: Text("No more data to fetch"),),
                  );
          }),
    );
  }
}
