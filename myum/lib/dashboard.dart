import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isBold = false;

  bool isHoverd = false;
  bool isHoverdImagee = true;

  

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child:    
            
        
        
        Container(
          padding: EdgeInsets.all(20),  
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
                isHoverd = false;
                isHoverdImagee = true;
              });
            },
            onExit: (event) {
              setState(() {
                isBold = false;
                isHoverd = true;
                isHoverdImagee = false;
              });
            },
            child:

           
          
          
          
          TweenAnimationBuilder(tween: Tween<double>(
          begin: 16/9,
          end: isHoverdImagee
            ? 16/11
            : 16/9
          ), 
          duration: Duration(milliseconds: 300), 
          curve: Curves.easeInOut,
          builder: ( context, aspectRatio, child  ){
            return 


              AspectRatio(aspectRatio: aspectRatio,
              child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
        

                  child: Stack(
                    children: [
                      // insert gradien here
                      Positioned.fill(child: 


                        Image.network("https://news.miami.edu/frost/_assets/images/images-stories/2025/02/snarkypuppy940x529.png", fit: BoxFit.cover),),      
                      //_buildGradient

                    ],
                    
                  )
                ),
              );


          }  ),
          
          
          
          
          
          
          
          
          
          
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
            
            





            TweenAnimationBuilder(tween: 
              TextStyleTween(
                begin: TextStyle(fontSize: 0, color: Color.fromRGBO(0, 0, 0, 0)),
                end: isHoverd
                  ? TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1))
                  : TextStyle(fontSize: 10, color: Color.fromRGBO(0, 0, 0, 1))
              ), 
              duration: isHoverd
                ? Duration(milliseconds: 500)
                : Duration(milliseconds: 500)
              ,
              curve: isHoverd
                ? Curves.easeOut
                : Curves.easeOut
              ,
              builder: (context, style, child ) {
                  return Text(
                    "At the GroundUP Music Festival, the Frost Jazz Sextet from the University of Miami received live, onstage feedback from Snarky Puppy’s Michael League and band members. Performing in front of a crowd, the students worked through their original tune “Waves” and learned the importance of listening, groove, and collaboration. League s guidance helped the group play more cohesively and confidently, transforming their sound. The students left the session inspired and motivated, gaining valuable insight into professional musicianship and the power of musical connection.", ///////////
                    style: style);
              } ),


            
            











        ],),


        ),


      
      
      
      
      );
    
  }
}




