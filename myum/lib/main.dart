import 'package:flutter/material.dart';

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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.brown,
        ),
        body: Center(child: <Widget>[
          Text("Dahdboard"),
          Text("Page $curPagIndex"),
          Text("Page $curPagIndex"),
          Text("Page $curPagIndex"),
          Text("Page $curPagIndex")
        ][curPagIndex],
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
