//shortcuts: stless stful



import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  
  DestinationWidget({required this.destinationName});

  final String destinationName;



  @override
  Widget build(BuildContext context) {
    return Row(children: [

      Text(destinationName),
      Image(image: NetworkImage(('https://picsum.photos/200/300'),)),
    ],);
  }
}