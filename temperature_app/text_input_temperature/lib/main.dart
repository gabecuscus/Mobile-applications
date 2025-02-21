import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConvertorMain());
}


//stl
class TemperatureConvertorMain extends StatelessWidget {
  const TemperatureConvertorMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TemperatureConvertor(),




    );
  }
}

//stf
class TemperatureConvertor extends StatefulWidget {
  const TemperatureConvertor({super.key});

  @override
  State<TemperatureConvertor> createState() => _TemperatureConvertorState();
}

class _TemperatureConvertorState extends State<TemperatureConvertor> {
// all class variable
  int groupVal = 0;

  // double sliderVal = 0;
  double T = 0.0; // temp to covnert
  double R = 0; // covnerted value

  // holds the display  text for the last widget
  String converted = "";


  double sliderVal = 20.0;
  Color sliderColor = Colors.black;



  // CUSTOM methods
  performConversion(int value) {
    // C = (f - 32) (5/9)
    // F = (C  x 9/5) + 32

    setState(() {
      groupVal = value;
      // value holdes the value of the checked radio button
        // 1 or 2
        if(value == 1){
          // F to C
          R = (T - 32) * (5/9);
          converted = "$R C";

          sliderVal = T;

        } else if (value == 2){
          // C to F
          R = (T*9/5) + 32;
          converted = "$R F";

          sliderVal = R;

        }

        if(sliderVal>100){
        sliderVal=100.0;
        }
        if(sliderVal<0.0){
        sliderVal=0.0;
        }
        
        if(sliderVal<32.0){
          sliderColor = Colors.purple;
        }else if(sliderVal<52){
          sliderColor = Colors.blue;
        }else if(sliderVal<72){
          sliderColor = Colors.green;
        }else if(sliderVal<82){
          sliderColor = Colors.yellow;
        }else if(sliderVal>82){
          sliderColor = Colors.red;
        }






        // print(R);
      
    });
    
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("tempooo convertor"),
          backgroundColor: Colors.brown,        
        ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        // child: 
        
        child: Column(
          children: <Widget> [
            SizedBox(height: 10.0,),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter temperature"),
                onChanged: (String value){
                  //TO DO somehting with value
                  if(value==""){
                    // hey write something
                  }else{
                    T = double.parse(value);
                  }

                },),
            SizedBox(height: 10.0,),

            Row(//houseing radio button
              children: <Widget>[

                Radio(
                  value: 1, // F to C is option1
                  groupValue: groupVal, // 
                  onChanged: (curValue){
                      // TO DO logic
                      performConversion(curValue!);
                  }),

                  Text('F to C'),


                SizedBox(height: 10.0,),



                Radio(
                  value: 2, // C to F is option1
                  groupValue: groupVal, // 
                  onChanged: (curValue){
                      // TO DO logic
                      performConversion(curValue!);
                  }),

                  Text('C to F'),

              ],
            ),

            SizedBox(height: 10.0,),

            TextButton(
              onPressed: (){

                setState(() {
                  //Performs clearing operations
                  converted = "";
                  groupVal = 0;
                });

              }, 
              child: Text("Clear"),
              ),
            
            SizedBox(height: 20.0,),

            Text(converted),

            SizedBox(height: 10.0),
            Slider(
              value: sliderVal,
              onChanged: (deValue){
                // set color of slider

              },
              activeColor: sliderColor,
              min: 0.0,
              max:100.0,
            ),

          ],
        )

        ),

    );
  }
}