import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isBold = false;

  

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child:    
            
        
        
        Container(  
            decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 229, 238),
        borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[ BoxShadow( color: const Color.fromARGB(255, 7, 7, 6), blurRadius: 20, offset: Offset(3, 5)),   ],
          ),

        

          child:
        Column(children: [

          
          
          MouseRegion(
            onEnter: (event) {
              setState(() {
                isBold = true;
              });
            },
            onExit: (event) {
              setState(() {
                isBold = false;
              });
            },
            child: 
            Image.network("https://news.miami.edu/frost/_assets/images/images-stories/2025/02/snarkypuppy940x529.png",
            width: 400.0,),
          ),

            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 100),
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 20.0,
                fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
              ),
        
              child: Text("Learning live and onstage"),
              
            ), 
            
            
            

            Text("The Frost Jazz Sextet with Snarky Puppy leader Michael League (left) at the GroundUP festival on Miami Beach on Saturday", 
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),),)


        ],),


        ),


      
      
      
      
      );
    
  }
}




