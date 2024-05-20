import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/games.dart';
import 'package:netflix_ui/Screens/home.dart';
import 'package:netflix_ui/Screens/myNetflix.dart';
import 'package:netflix_ui/Screens/newhot.dart';
import 'package:netflix_ui/Screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor:Colors.black 
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int indexNum =0;
  final screens = const [
    HomePage(),
    GamesPage(),
    NewHotPage(),
    MyNetflixPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: screens.elementAt(indexNum),

      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.sports_esports),label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library),label: "News & hot"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "My Netflix"),
        ],
        showSelectedLabels: true,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: indexNum,
        type:BottomNavigationBarType.fixed,
        enableFeedback: false,

        onTap: (int index){
          setState(() {
            indexNum = index;
          });
        },
        ),
    );
  }
}