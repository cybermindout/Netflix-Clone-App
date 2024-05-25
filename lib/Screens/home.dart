// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/api/api.dart';
import 'package:netflix_ui/constant.dart';
import 'package:netflix_ui/models/movies.dart';
import 'package:netflix_ui/widgets/custom_slider.dart';
import 'package:netflix_ui/widgets/tabbar_home.dart';
import 'package:netflix_ui/widgets/main_card_home.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Netflix-new-icon.png/800px-Netflix-new-icon.png'),
            actions: const [
              Icon(
                Icons.menu,
                size: 35,
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: ValueListenableBuilder<bool>(
                valueListenable: scrollNotifier,
                builder: (context, isTabBarVisible, _) {
                  return isTabBarVisible
                      ? const HomeTabBar()
                      : const SizedBox();
                },
              ),
            ),
          ),
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              // print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    Center(
                      child: cardHome(),
                    ),
                    CustomSlider(
                        title: "Popular", sliderList: popularMoviesList),
                    CustomSlider(
                        title: "Now Playing", sliderList: nowPlayingList),
                    CustomSlider(title: "Top Rated", sliderList: trendingList),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
