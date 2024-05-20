import 'package:flutter/material.dart';
import 'package:netflix_ui/api/api.dart';
import 'package:netflix_ui/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getUpcoming();
    getPopularMovies();
    getTopRated();
    getNowPlaying();
    getAllMovies();
    goToHome();
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://i.pinimg.com/originals/f6/b1/1b/f6b11bd53411d94338117381cf9a9b9b.gif')
          ],
        ),
      ),
    );
  }
  Future<void> goToHome() async{

    await Future.delayed(const Duration(milliseconds: 2900));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement( MaterialPageRoute(builder:(ctx)=>const MyHomePage()));
  }

}