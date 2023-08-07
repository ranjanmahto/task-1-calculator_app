import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userinput='';
    var result='';
  @override
  Widget build(BuildContext context) {
    
    return   MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                       Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userinput.toString(),style: const TextStyle(fontSize: 30,color: Colors.white),)),
                      const  SizedBox(height: 10,),
                   Align(
                    alignment: Alignment.bottomRight,
                    child: Text(result.toString(),style: const TextStyle(fontSize: 30,color: Colors.white),)),
                    
                  ],
                 ),
               ),
             ),
             Expanded(
              flex: 2,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 7),
                 child: Column(
                  children: [
                     Row(
                    children: [
                       MyButton(title : 'AC',onpress: (){
                        userinput ='';
                        result='';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '+/-',onpress: (){
                        userinput ='';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '%',onpress: (){
                        userinput +='%';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '/',onpress: (){
                        userinput +='/';
                        setState(() {
                          
                        });
                       },c: Color(0xffffa00a),),
                    
                    ],
                   ),
                      Row(
                    children: [
                       MyButton(title : '7',onpress: (){
                        userinput +='7';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '8',onpress: (){
                        userinput +='8';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '9',onpress: (){
                        userinput +='9';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '/',onpress: (){
                        userinput +='/';
                        setState(() {
                          
                        });
                       },c: Color(0xffffa00a),),
                    
                    ],
                   ),
                       Row(
                    children: [
                       MyButton(title : '4',onpress: (){
                        userinput +='4';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '5',onpress: (){
                        userinput +='5';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '6',onpress: (){
                        userinput +='6';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : 'x',onpress: (){
                        userinput +='x';
                        setState(() {
                          
                        });
                       },c: Color(0xffffa00a),),
                    
                    ],
                   ),
                    Row(
                    children: [
                       MyButton(title : '1',onpress: (){
                        userinput +='1';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '2',onpress: (){
                        userinput +='2';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '3',onpress: (){
                       userinput +='3';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '+',onpress: (){
                        userinput +='+';
                        setState(() {
                          
                        });
                       },c: Color(0xffffa00a),),
                    
                    ],
                   ),
                     Row(
                    children: [
                       MyButton(title : '0',onpress: (){
                        userinput +='0';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '-',onpress: (){
                        userinput +='-';
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : 'DEL',onpress: (){
                        userinput =userinput.substring(0,userinput.length -1);
                        
                        setState(() {
                          
                        });
                       },),
                       MyButton(title : '=',onpress: (){
                        equalpress();
                        setState(() {
                          
                        });
                       },c: Color(0xffffa00a),),
                    
                    ],
                   ),
                  ],
                 ),
               ),
             )
            ],
          ) ,
        ),
      ),
    );
  }
  void equalpress()
  {
    String finalstring= userinput;
    finalstring= userinput.replaceAll('x', '*');
    Parser p =Parser();
    Expression expression =p.parse(finalstring);
    ContextModel contextModel=ContextModel();
    
    double r=expression.evaluate(EvaluationType.REAL, contextModel);
    result= r.toString();
  }

}

class MyButton extends StatelessWidget {
  final String title;
  final Color c;
  final VoidCallback onpress;
   MyButton({super.key,required this.title, this.c= const Color(0xffa5a5a5),required this.onpress});

  @override
  Widget build( context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 80,
            decoration:  BoxDecoration(
              color: c,
              shape: BoxShape.circle,
            ),
            child:  Center(child: Text(title ,style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 20,),),),
          ),
        ),
      ),
    );
  }
}