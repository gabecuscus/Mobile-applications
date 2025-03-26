import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'customcard.dart';
import 'paralaxcard.dart';

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp()
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {

  int curPagIndex = 0;
// "https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-940x529.jpg"
// " text to dthe left bottom of the cplumnsn bllaaeeeoppppppp  blee blo whas good les play some rivlas"

var img = [
    "https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/st-patricks-day-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/foods-that-prevent-cancer-and-heart-disease-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/california-fires-climate-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/centennial-new-york-event-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/spark-research-hero-790x527.jpg",
    
  ];
var titles = [
    "A winning formula",
    "Born in the USA: St. Patricks Day",
    "Foods to fortify",
    "New powerful tool in the fight against wildfires, extreme events",
    "Alumni Engagement kicks off new year in New York",
    "Delving into cancer research"

  ];
var summary = [
    "More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.",
    "A University of Miami professor who specializes in Irish culture traces the roots of the popular holiday to Irish émigrés who fled the “Great Hunger” in their homeland to seek a new start in America.",
    "Experts in nutrition science from across the University of Miami offer their thoughts on some of the best foods to help us ward off chronic disease.",
    "A grant recently awarded to the University of Miami promises to help in the preparation for and mitigation of the impacts of wildfires, flooding, heat waves, drought, and other events.",
    "More than 200 New York-based Canes celebrated the Universitys Sprint to Our Centennial at The Pierre hotel in New York City.",
    "A new program encourages undergraduates to work in labs at Sylvester Comprehensive Cancer Center."

  ];

var titles2 = [
"Battling dementia: Unraveling the mysteries of Alzheimers",
"Distinguished alumni to deliver commencement keynotes",
"Flamingos, fish, and survival instincts",
"Notre Dame Cathedral to reopen",
"Climate adaptation knowledge varies between socioeconomic groups",
"Bomb cyclone adds to growing extreme weather trend"

];
var img2 = [
"https://news.miami.edu/_assets/images-stories/2024/12/vascular-dementia-hero-790x527.jpg",
"https://news.miami.edu/_assets/images-stories/2024/12/december-commencement-speakers-2024-hero-790x527.jpg",
"https://news.miami.edu/_assets/images-stories/2024/12/sharks-vs-flamingos-hero-790x527.jpg",
"https://news.miami.edu/_assets/images-stories/2024/12/notre-dame-reopening-hero-790x527.jpg",
"https://news.miami.edu/as/_assets/images/images-stories/2024/11/errodeddunes790by527.jpg",
"https://news.miami.edu/_assets/images-stories/2024/11/west-coast-bomb-cyclone-hero-790x527.jpg"



];
var summary2 = [
"Armed with a 3.4 million grant from the National Institute of Neurological Disorders and Stroke, a team of University of Miami scientists is studying the role of the immune system in the progression of dementia-related illnesses.",
"Michael Irvin and Alina T. Hudak will address the more than 1,000 fall graduates of the Class of 2024 during commencement ceremonies at the Watsco Center on Dec. 12.",
"A College of Arts and Sciences course brings animal instincts to life with students stepping into animal roles with inflatables to simulate behaviors like hunting and evading predators.",
"University of Miami professors discuss the history of the cathedral and the efforts to restore it following the 2019 fire.",
"University of Miami researcher Haoluan Wang surveyed residents in South Florida to determine how much they know about seawalls, mangroves, and other flooding prevention methods. ",
"The “once-in-a-decade” storm that devastated the Pacific Northwest last week caused widespread outages, damage, and at least two deaths. Data shows the storms are becoming more common. Could climate change be a key driver?",
];

var titles3 = [
  "Trailblazing professor Whittington Johnson passes away",
  "Counting down to the centennial",
  "Renewed wonder in the cloud forests of Ecuador",
  "New initiative to fuel neuroscience and aging research",
  "Staying safe on campus",
  "What makes a criminal?"
];
var img3 = [
  "https://news.miami.edu/_assets/images-stories/2024/11/whittington-b-johnson-hero-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2024/10/centennial-preview-hero-2-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2024/10/natu-plant-extinction-ecuador-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2024/10/basic-science-ford-prado-nimer-hero-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2024/09/september-campus-safety-month-hero-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2024/09/piquero-class-theory-of-deviance-hero-790x527.jpg"

];
var summary3= [
  "Called Dr. J by his students and Whitt by his colleagues in the Department of History, Johnson became the first Black tenured professor hired by the University of Miami, inspiring countless students and conducting research that still has an impact today.",
  "The University of Miami is set to kick off a yearlong centennial celebration in January 2025, marking 100 years since its founding.   ",
  "Recent expeditions reveal that unique plants presumed to be extinct are still hanging on in the forest patches of Centinela, Ecuador, lauded as a hotspot for biodiversity.",
  "The University of Miami will invest 30 million to enhance research and innovation in basic science, with a focus on the areas of neuroscience and aging.",
  "Since this month is National Campus Safety Awareness and Preparedness Month, take stock of some tips to keep yourself safe.",
  "A University of Miami criminology class, taught by professor Alex Piquero, seeks to find the answer."
];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM", style: TextStyle(color: const Color.fromARGB(255, 244, 245, 246)),),
        backgroundColor: Colors.blueAccent,
        ),
        body: Center(

          child: <Widget>[
            Dashboard(),


            Container(

              decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 241, 247)),

              child: 
            
            ListView(children: <Widget>[
              for(int i=0; i<6; i++)
              CustomeCard(img[i], titles[i], summary[i] )
            ],
            ),

            ),


            Container(

              decoration: BoxDecoration(color: Color.fromARGB(255, 238, 241, 247)),

              child: 
              ListView( children: <Widget>[
              for(int i=0; i<6; i++)
                CustomeCard(img2[i], titles2[i], summary2[i])
              ],
              )

            ),
            



            Container(

              decoration: BoxDecoration(color: Color.fromARGB(255, 238, 241, 247)),

              child: 

            ListView(children: <Widget>[
              for(int i=0; i<6; i++)
                Paralaxcard(img3[i], titles3[i], summary3[i])
            ],),



            ),




            Text("Page $curPagIndex"),
            Text("Page $curPagIndex")

          ][curPagIndex]
          
          
        
        
        
        
        ),


        



        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index){
            setState(() {
              curPagIndex = index;
            });
          },
          
          

          destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard"),
           NavigationDestination(
            icon: Icon(Icons.pages),
            label: "page 1"),
          NavigationDestination(
            icon: Icon(Icons.settings_input_component_sharp), 
            label: "cool resistors"),
          NavigationDestination(
            icon: Icon(Icons.accessibility_new_sharp), 
            label: "hands up"),
          NavigationDestination(
            icon: Icon(Icons.accessibility_rounded), 
            label: "hands down")
        ]),
    );
  }
}
