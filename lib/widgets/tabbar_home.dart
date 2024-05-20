
import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8,),
        TabBar(
        tabs: const [
          Tab(text: 'TV Shows',),
          Tab(text: 'Movies',),
          Tab(text: 'Categories',),
        ],
              unselectedLabelColor: Colors.white,
              labelColor: const Color.fromARGB(255, 247, 247, 247),
              indicatorColor: Colors.white,
              indicatorSize:TabBarIndicatorSize.tab,
              indicatorWeight: 0.5,
              isScrollable: true,
              indicator: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
                // color: Color.fromARGB(255, 244, 244, 244)
              ),
              indicatorPadding: const EdgeInsets.all(8),),
      ],
    );
  }
}

