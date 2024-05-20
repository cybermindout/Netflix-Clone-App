
import 'package:flutter/material.dart';
import 'package:netflix_ui/constant.dart';
import 'package:intl/intl.dart';


// ignore: must_be_immutable
class ComingSoon extends StatefulWidget {
   ComingSoon({
    super.key,
    required this.list,
    required this.index
  });
  int index;
 List list;

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Row(
      children: [
         SizedBox(width: 50,height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
           DateFormat('MMM').format(DateTime.parse(widget.list[widget.index]['release_date'])),
  style: TextStyle(fontSize: 15),
),

             Text(
           DateFormat('dd').format(DateTime.parse(widget.list[widget.index]['release_date'])),
  style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
),
          ],
        ),),
        SizedBox(
          width: size.width-50,
          height: 350,
          child:  Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width:double.infinity,
                    height: 160,
                    child: Image.network(imagePath+widget.list[widget.index]['backdrop_path'],
                    fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: 0,right: 10,
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
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(widget.list[widget.index]['title'],style: const TextStyle(fontSize: 20),)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.notifications),SizedBox(width: 20,),
                      Icon(Icons.info_outline)
                    ],
                  ),
                ],
                           ),
               SizedBox(height: 120,width: 400,
                 child: Text(widget.list[widget.index]['overview'],
                             style: const TextStyle(
                  color: Colors.grey,fontSize: 17
                             ),),
               )
            ],
          ),
          ),
      ],
    );
  }
}