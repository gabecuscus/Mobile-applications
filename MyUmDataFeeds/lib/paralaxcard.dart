import 'package:flutter/material.dart';

class Paralaxcard extends StatefulWidget {
  final String img;
  final String title;
  final String summary;

  const Paralaxcard(this.img, this.title, this.summary, {super.key});

  @override
  State<Paralaxcard> createState() => _ParalaxcardState();
}

class _ParalaxcardState extends State<Paralaxcard> {

  double dx = 2;
  double dy = 3;

  bool isHoverd = false;



  @override
  Widget build(BuildContext context) {
  return 
Container(
  child:
    
    
    
    Container(
      margin: EdgeInsets.fromLTRB(50, 16, 50, 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 229, 238),
        borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[ BoxShadow( color: const Color.fromARGB(255, 7, 7, 6), blurRadius: 20, offset: Offset(dx, dy)),   ],
          ),

          child: Column(children: <Widget>[
      

      // IMAGE -------------------------------------------------
        
      TweenAnimationBuilder(tween: Tween<double>(
          begin: 16/9,
          end: isHoverd
            ? 16/7
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


                        Image.network(widget.img, fit: BoxFit.cover),),      
                      //_buildGradient

                    ],
                    
                  )
                ),
              );


          }  ),




        


      
    MouseRegion(
    onEnter: (event){
      setState(() {
        dx= 5;
        dy = 15;
        isHoverd = true;
      });
    },
    onExit: (event){
      setState(() {
        dx= 2;
        dy = 3;
        isHoverd = false;
      });
    },

    child: Column(children: [

      // )
      // TITLE  --------------------------------------------------
        Padding(
          padding: EdgeInsets.all(16),
          child:
         
          Text( widget.title,////////
            textAlign: TextAlign.left,
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            )),),
        

      // SUMMARY  --------------------------------------------------
        Padding(
          padding: EdgeInsets.all(16),
          child:

            TweenAnimationBuilder(tween: 
              TextStyleTween(
                begin: TextStyle(fontSize: 0, color: Color.fromRGBO(0, 0, 0, 0)),
                end: isHoverd
                  ? TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1))
                  : TextStyle(fontSize: 0, color: Color.fromRGBO(0, 0, 0, 0))
              ), 
              duration: isHoverd
                ? Duration(milliseconds: 200)
                : Duration(milliseconds: 1000)
              ,
              curve: isHoverd
                ? Curves.easeOut
                : Curves.easeOut
              ,
              builder: (context, style, child ) {
                  return Text(
                    widget.summary,///////////
                    style: style);
              } ),


        ),






    ],)

      ),

        

      
      
      
        ],
      ),

      ),
    );
  }
}