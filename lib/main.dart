import 'package:flutter/material.dart';
import 'screens/login_screen.dart';


void main(){

  runApp(
    const SmartDiscipline()
  );

}


class SmartDiscipline extends StatelessWidget{

  const SmartDiscipline({super.key});


  @override
  Widget build(BuildContext context){

    return MaterialApp(

      debugShowCheckedModeBanner:false,

      title:"Smart Discipline",

      theme:ThemeData(

        colorSchemeSeed:
        Colors.blue,

        useMaterial3:true,

      ),


      home:
      const LoginScreen(),

    );

  }

}