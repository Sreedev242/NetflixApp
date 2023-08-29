import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/main_page/widgets/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
   
Timer(Duration(seconds: 3), () { 
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
    return ScreenMainPage();
  }));
});


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final screenwidth=MediaQuery.of(context).size.width;
  final screnHeight=MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.black,body: 
    Center(
      child: Container(
        height: screnHeight*1/6,
        width:screenwidth*1/6,
        decoration: BoxDecoration(image:DecorationImage(
          fit: BoxFit.cover,
        image: NetworkImage('https://www.simula.no/sites/default/files/styles/original_dimension_image/public/articles/images/netflix-new-icon.png?itok=6VPQzEK-'))),
      ),
    ),);
}
}