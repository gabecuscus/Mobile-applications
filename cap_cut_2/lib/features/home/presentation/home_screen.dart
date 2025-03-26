import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CusCusEditor'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            // redirect to video editor screen
          }, 
          child: Text('create new project'))
        
      ),

    );
  }
}