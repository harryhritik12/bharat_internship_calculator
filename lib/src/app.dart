import 'package:flutter/material.dart';
 
import 'package:math_expressions/math_expressions.dart';
import 'colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  

  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  double first=0.00;
  double second=0.00;
  var input='';
  var output='';
  var opr='';
  var hideinput=false;
  var outputsize=34.0;
  onButtonClick(value){
  if(value=='AC'){
    input='';
    output='';

  }else if(value=='<'){
    if(input.isNotEmpty){
    input=input.substring(0,input.length-1);
    }
  }
  else if(value=='='){
    var userInput=input;
    userInput=input.replaceAll("x", "*");
    Parser p= Parser();
    Expression expression =p.parse(userInput);
    ContextModel cm =ContextModel();
    var finalValue=expression.evaluate(EvaluationType.REAL, cm);
    output =finalValue.toString();
    if(output.endsWith(".0")){
    output=output.substring(0,output.length-2);
    }
    input=output;
    hideinput=true;
    outputsize=54;
 
 }
 else{
  input=input+value;
   hideinput=false;
  outputsize=34.0;
  
 }
 setState(() {
 

  
 });

  }
@override
  Widget build(context){
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
         children: [
         Expanded(child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          
          child:    Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Text(
                hideinput? '':input,
              style: const TextStyle(
                fontSize: 48,
                color: Colors.white,

                       ),
              
              ),
              const SizedBox(height: 20,),
              Text(output,
              style: TextStyle(
                fontSize: outputsize,
                color: Colors.white.withOpacity(0.7),

                       ),
              
              ),
              const SizedBox(height: 30,),
            ],
          ),
          )
          ),
          Row(
            children: [
              button(txt: 'AC',buttonnColor: oprCOlor,txtcolor: orangeColor),
               button(txt: '<',buttonnColor: oprCOlor,txtcolor: orangeColor),
                button(txt: '',buttonnColor: Colors.transparent,txtcolor: orangeColor),
                 button(txt: '/',buttonnColor: oprCOlor,txtcolor: orangeColor),
              

            ],
          ),
           Row(
            children: [
              button(txt: '7',buttonnColor: oprCOlor),
               button(txt: '8',buttonnColor: oprCOlor),
                button(txt: '9',buttonnColor: oprCOlor),
                 button(txt: 'x',buttonnColor: oprCOlor,txtcolor: orangeColor),
              

            ],
          ),
           Row(
            children: [
              button(txt: '4',buttonnColor: oprCOlor),
               button(txt: '5',buttonnColor: oprCOlor),
                button(txt: '6',buttonnColor: oprCOlor),
                 button(txt: '-',buttonnColor: oprCOlor,txtcolor: orangeColor),
              

            ],
          ),
           Row(
            children: [
              button(txt: '3',buttonnColor: oprCOlor),
               button(txt: '2',buttonnColor: oprCOlor),
                button(txt: '1',buttonnColor: oprCOlor),
                 button(txt: '+',buttonnColor: oprCOlor),
              

            ],
          ),
          Row(
            children: [
              button(txt: '%',buttonnColor: oprCOlor,txtcolor: orangeColor),
               button(txt: '0',buttonnColor: oprCOlor ),
                button(txt: '.',buttonnColor: oprCOlor),
                 button(txt: '=',buttonnColor: oprCOlor,),
              

            ],
          ),
          
         ], 
      ),

    );
  }
  Widget button({
    txt,txtcolor= Colors.white, buttonnColor =buttnColor
  }){
    return Expanded(
                child: Container(
                  margin:const EdgeInsets.all(8) ,
                child: ElevatedButton(
                  style :ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                  backgroundColor:buttonnColor,
                  ),
                  onPressed: ()=>onButtonClick(txt),
                  child:  Text(txt,
                  style: TextStyle(
                    fontSize: 18,
                    color: txtcolor,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ), 
                )
                ,);
                  
  }
  
}
