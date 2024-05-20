import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_ui/api/api.dart';
import 'package:netflix_ui/widgets/list_view_games.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {

    List _filterdata = [];
  final _searchQuery = TextEditingController();
  Timer? _debounce;
  String searchText="";

  @override
  void initState() {
    _filterdata = allMoviesList;

    _searchQuery.addListener(onSearchChanged);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search Movies"),
        // actions: [
        //   IconButton(onPressed: (){
        //     setState(() {
              
        //     });
        //   }, icon:Icon(Icons.replay_outlined))
        // ],
      ),

      body:  SingleChildScrollView(
        child: Column(
          children: [
              Container(
                color: Colors.grey.shade700,width: double.infinity,
                child:TextFormField(
                  controller: _searchQuery,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white), 
                    suffixIcon: Icon(Icons.mic, color: Colors.white),   
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),      
                    ),
                    hintText: "Search movies, shows, tv...",    
                  ),
                  onChanged: 
                    onSearchChanged()
                  ,
                ),
              ),
            SizedBox(height: 20,),
        SizedBox(
          height: 800,
          
          child: CustomListView(list: allMoviesList,s: _searchQuery.text,newList:_filterdata,))
          ],
        ),
      ),

    );
  }

  
  onSearchChanged(){
    if(_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500),
    (){
      if(searchText != _searchQuery.text){
        _filterdata = allMoviesList;

        setState(() {
          // _filterdata = allMoviesList;
          _filterdata = _filterdata.where((item) => 
          item.toString().toLowerCase().contains(_searchQuery.text.toString().toLowerCase())).toList();
        });
      }
      searchText = _searchQuery.text;
    });
  }

  @override
void dispose() {
  _searchQuery.removeListener(onSearchChanged);
  _searchQuery.dispose();
    _debounce?.cancel();
    super.dispose();
}

}