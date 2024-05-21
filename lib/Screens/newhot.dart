// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_ui/api/api.dart';
import 'package:netflix_ui/api/api_links.dart';
import 'package:netflix_ui/widgets/coming_soon.dart';
import 'package:netflix_ui/widgets/everyones_watching.dart';

class NewHotPage extends StatefulWidget {
  const NewHotPage({super.key});

  @override
  State<NewHotPage> createState() => _NewHotPageState();
}
 
class _NewHotPageState extends State<NewHotPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("New & Hot"),
          actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))],

          bottom: TabBar(tabs: const[
            Tab(text: "🍿Coming Soon",),
            Tab(text: "🔥Everyone's Watching",)
          ],
          unselectedLabelColor: Colors.white,
          labelColor: Colors.black,
          indicatorColor: Colors.white,
          isScrollable: true,
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            color: Colors.white, 
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)
          ),
          indicatorPadding: EdgeInsets.fromLTRB(-4, 8, -4, 8),
          ),
        ),

        body: TabBarView(
          children: [
          buildComingSoon(),
          buildEveryonesWatching()
        ]),
      ),  
    );
  }
  
Widget buildComingSoon() {

  return ListView.builder(
    itemCount:10,
    itemBuilder: (BuildContext context, index) {
      return  ComingSoon(list:upcomingList,index: index,);
    });
 }
  
Widget buildEveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, index) {
     return  EveryonesWatching(list:popularMoviesList,index: index,);
    });
 }

}
