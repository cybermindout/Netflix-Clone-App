import 'package:flutter/material.dart';
import 'package:netflix_ui/constant.dart';

Stack cardHome() {
  return Stack(
    children: [
      Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(mBanner),
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: Colors.white),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        top: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            playButtonHome(),
            myListButtonHome(),
          ],
        ),
      ),
    ],
  );
}

TextButton myListButtonHome() {
  return TextButton.icon(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white38),
    ),
    onPressed: () {},
    icon: const Icon(Icons.add, color: Colors.white),
    label: const Text("My List", style: TextStyle(color: Colors.white)),
  );
}

TextButton playButtonHome() {
  return TextButton.icon(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
    ),
    onPressed: () {},
    icon: const Icon(Icons.play_arrow, color: Colors.black),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text("Play", style: TextStyle(color: Colors.black)),
    ),
  );
}
