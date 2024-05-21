// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/details_page.dart';
import 'package:netflix_ui/constant.dart';

class CustomListView extends StatefulWidget {
  CustomListView({
    super.key,
    required this.list,required this.s,required this.newList
  });

  List list;
  List newList;
  String s;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}
class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (widget.s.isEmpty)
          ? ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      imagePath + widget.list[index]['backdrop_path'],
                      fit: BoxFit.cover,
                    ),
                    title: Text(widget.list[index]['title']),
                    trailing: IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              image: imagePath +
                                  widget.list[index]['backdrop_path'],
                              title: widget.list[index]['title'],
                              details: widget.list[index]['overview'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            )
          : (widget.newList.isEmpty)
              ? const Column(
                  children: [
                    SizedBox(height: 30,),
                    Text("Oops.We haven't got that.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Text("Try searching for another movies",style: TextStyle(color:Colors.grey),)
                  ]
                )
              : ListView.builder(
                  itemCount: widget.newList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          imagePath + widget.newList[index]['backdrop_path'],
                          fit: BoxFit.cover,
                        ),
                        title: Text(widget.newList[index]['title']),
                        trailing: IconButton(
                          icon: Icon(Icons.play_circle_outline),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  image: imagePath +
                                      widget.newList[index]['backdrop_path'],
                                  title: widget.newList[index]['title'],
                                  details: widget.newList[index]['overview'],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
