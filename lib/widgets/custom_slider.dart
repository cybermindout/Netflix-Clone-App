
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/Screens/details_page.dart';
import 'package:netflix_ui/constant.dart';

class CustomSlider extends StatefulWidget {
   CustomSlider({
    super.key,required this.title,required this.sliderList
  });
  String title;
  List<Map<String,dynamic>> sliderList;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40,),
        SizedBox(
  child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(widget.title, style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w800)),
            const SizedBox(height: 10,),
          SizedBox(
             height: 200,
             width: double.infinity,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               physics: const BouncingScrollPhysics(),
               itemCount: widget.sliderList.length,
               itemBuilder: (context,index){
                 return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(
                      image: imagePath+widget.sliderList[index]['backdrop_path'],
                      title: widget.sliderList[index]['title'],
                      details: widget.sliderList[index]['overview'],

                    ),));
                  },
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(8),
                       child: SizedBox(
                         height: 150,
                         width: 150,
                         child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          imagePath+widget.sliderList[index]['poster_path']
                         ),
                       ),
                     ),
                   ),
                 );
               }),
            ),
        ],
  )
        ),
      ],
    );
  }
}
