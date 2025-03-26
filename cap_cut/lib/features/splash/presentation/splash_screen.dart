import 'dart:async';

import 'package:cap_cut/features/editor/presentation/video_editor_screen.dart';
import 'package:cap_cut/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context)=>HomeScreen() 
          )
        );
    }  );

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [
          
          AnimatedScale(
            scale: -1, 
            duration: Duration(seconds: 2),
            child: Image.asset('assets/MesumePiece1.png', height: 100,),
          ),
          

          SizedBox(height: 20,),
          Text(
            'CusCus Editor',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        
        ],)
      )
    );
  }
}