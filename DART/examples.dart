// comments

// variables
// Variable and Data Types
// Control Flows and Looping
// functions and methods
//     void creats a fucntion which does not return a value
//     main is reserved fo dart
//       { code to be executed } 

void main() {
  /* for (var i = 0; i < 10; i++) {
    print('hello ${i + 1}');
  } */
 greeting();
}

void greeting() {
 print("hello"); 

 int prent = addTo(3);
 print(prent);


 var inferredString = "William";
 String explicitString = "Jattin";

 
 print(inferredString + explicitString);

  // null saftey
  int? someNumber;

  print(someNumber);
  // late keyword   variables that get initialzied later in the code
  // late int willBeNumber;
  // print(willBeNumber);

  int? goals;
  
  if(goals != null){
    print(goals + 2);
  } else {
    print("goals is null");
  }


// BUILT IN DATA TYPES
int age = 21;
num count = 3;
double temp = 23.7;
bool isReady = false;
// collections: lists, arrays and maps
// Strings for expressing text
String school = "Universty of Miami";

print("My schol is " + school);
// using palceholders
print("My schol is $school");

//built in type operations
print("my school name has ${school.length}");

if(school.length<10){
  print("ur school has short name");
} else {
  print("ur school long name");
}


// control operators
// <
// >
// <=
// >=
// ==
// != not equal


// arehtmetic operation
// * multiplication
// / division
// % mod

// MATH SHORTCUTS
int x = 10;
x = x + 5; // 15
x+= 5; // 20
// ! the opposite of an expression
bool isHere = false;//!isHere

// or statment ||
if(isHere|| (school.length<10)){
  //do something
}  


// while loop
int counter = 0;
while(counter < 5){
  print(counter);
  counter++;
}

do{
  print(counter);
  counter++;
} while(counter<20);



}

// types of variabek declartion like int balh blah
// buttttt    if we use var we can make it any other value
//                but once var is asgined to say an int, it stays as an int for the rest of the code




// operation with options or paramters
int addTo(int num) {
  int deNum = num + 2;
  return deNum;
}



