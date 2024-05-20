
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/details_page.dart';
import 'package:netflix_ui/constant.dart';

class EveryonesWatching extends StatefulWidget {
   EveryonesWatching({
    super.key,
    required this.index,
    required this.list
  });
  int index;
  List list;

  @override
  State<EveryonesWatching> createState() => _EveryonesWatchingState();
}

class _EveryonesWatchingState extends State<EveryonesWatching> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: InkWell(
                    child: Image.network(imagePath+widget.list[widget.index]['backdrop_path'],
                    fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(
                       image: imagePath+widget.list[widget.index]['backdrop_path'],
                        title: widget.list[widget.index]['title'],
                        details: widget.list[widget.index]['overview'],
                        ),));
                    },
                  ),
                ),
                Positioned(
                      bottom: 5,right: 10,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          onPressed:(){} , 
                          icon: const Icon(Icons.volume_off_outlined,
                          color: Colors.white,
                          size: 20,)),
                      ),
                    )
              ],
            ),
            const SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 300,
                  child: Text(widget.list[widget.index]['title'],style: const TextStyle(fontSize: 20),)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.share),SizedBox(width: 10,),
                    Icon(Icons.add),SizedBox(width: 10,),
                    Icon(Icons.play_arrow)
                  ],
                )
              ],
            ),const SizedBox(height: 15,),
             Text(widget.list[widget.index]['overview'],
            style: const TextStyle(color: Colors.grey,fontSize: 15),)
          ],
        ),
        SizedBox(height: 40,)
      ],
    );
  }
}
