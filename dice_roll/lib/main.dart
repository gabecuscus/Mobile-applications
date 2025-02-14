import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollMain());
}



// MaterialApp widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// End MaterialApp


class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber = 1;
  int diceNumber_b = 1;




  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 0.3;
    var screenheight = MediaQuery.of(context).size.height * 0.1;


    return Scaffold(/* Placeholder() */
      appBar: AppBar(
        title: Text("Dice Roll",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.blueGrey,
  

      ),
      
      body: Center(
      
        child: Column(
        
        // physics: ,
          
          // padding: EdgeInsets.fromLTRB(screenWidth, 2, screenWidth, 2),
          mainAxisAlignment: MainAxisAlignment.center, 
          
          //List<Widget> children = const <Widget>[],
          children: [
          SizedBox(
            width: 100.0,

            child:
            TextButton(
              
              onPressed:(){

                /* when button press execute this */
                setState(() {
                  //Random.NextInt(n) returns a random value between 0 and n-1
                  diceNumber = Random().nextInt(6) + 1;
                });
                
              }, 
                
              child: /* Text('You rolled a: $diceNumber') */
                    Image.asset("assets/images/dice-$diceNumber.png"),
            ),
            
          ),

          SizedBox(
            width: 100.0,

            child: TextButton(
            onPressed:(){

              /* when button press execute this */
              setState(() {
                //Random.NextInt(n) returns a random value between 0 and n-1
                diceNumber_b = Random().nextInt(6) + 1;
              });
              
            }, 
              
            child: /* Text('You rolled a: $diceNumber_b'), */
                  Image.asset("assets/images/dice-$diceNumber_b.png",),
          ),
          ),
        
            
          SizedBox(
            width: 200.0,
            height: 200.0,
            child: Center(
      
              child: 
            Text('Total: ${diceNumber+diceNumber_b}',
                style: TextStyle(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  color: Color.fromRGBO(32, 0, 32, 1),
                  fontSize: 30,
                  fontStyle: FontStyle.italic, 
                )),)
            
          ),

          SizedBox(
            width: 150.0,
            child: Image.network('https://i.ytimg.com/vi/wiX8oofW5B8/maxresdefault.jpg'),
          )
          
            
        

          ],

      ),
    )
    
    );
  }
}
