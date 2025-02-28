import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Quiz(),);
  }
}



int currentQuestion = 0;
int score = 0;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  // class variable
  int groupValue=2;
  // curQuestion= 0 to sater tiwth showinf first question
  // currentQuestion = 0;
  // int score = 0;

  var questions = ['a dozen == 12', 'a half dozen == 6', 'a bakers dozen == 11'];
  // first_q =false   second_q = false   third_q=true
  var answers = [1,1,0];

  String result = "";


  Color getResultColor(String result_in){
    if(result_in=="Corrrect!"){
      return Colors.green;
    }else{return Colors.red;}
    
  }


  // class methods
  checkAnswer(int answer){
    print("CheckAnswer() is called");

    print('user answered $answer');


    if(answers[currentQuestion]==answer){
      print("Corrrect");
      score++;
      result = "Corrrect!";
    }else{
      print("Inncorect");
      score--;
      result = "Inncorect!";
    }

    setState(() {
      groupValue = answer;
    });


    // if answer is true or false
        // set the score and show the results fo correct inncorect

    // set the group value
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Quiz App"),),

        body: Padding(
          padding: EdgeInsets.all(36.6),
          child: Column(
            children: <Widget>[
              Text(questions[currentQuestion]),
              Row(children: <Widget>[
                Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{ checkAnswer(e!)}),
                Text("True"),
                Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{ checkAnswer(e!)}),
                Text("false"),
              ],),
              TextButton(
                onPressed: ()=>{ setState(() {
                  if(currentQuestion==questions.length-1){
                    print("we are now at the end");

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ScorePage()),
                      );



                  }else{
                    currentQuestion++;
                  }
                groupValue = 2;
                result="";
              })}, 

              child: Text("Nextooo")),
              Text(
                result,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: getResultColor(result),
                )
                ),//CORRECT/INNCORRECT
              Text("score: $score"),


            ],)
        
        ),
        
    );
  }
}















class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text("Ending Page"),
        //automaticallyImplyLeading: false,// i had this before bcause i was using pop()
        ),

        body: Padding(
          padding: EdgeInsets.all(45.1),
          child: Column(
            children: <Widget>[
              Text("Your score is $score"),
              TextButton(onPressed: (){
                currentQuestion = 0;
                score=0;

          

                
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const Quiz()),
                  );
                }, 
                child: Text("Take Quiz again"))
              // TextButton(
              //   onPressed: ()=>{  setState(() {}) } 
              //   )
            ],
          )

        ),
        // footer ?
    );
  }
}