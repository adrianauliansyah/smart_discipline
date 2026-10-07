import 'package:flutter/material.dart';
import 'dashboard_screen.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {


  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  String selectedRole = "Guru";


  bool showPassword = false;



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(

        width: double.infinity,

        height: double.infinity,


        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [

              Color(0xff1565C0),

              Color(0xffE3F2FD)

            ],

          ),

        ),



        child: Center(


          child: SingleChildScrollView(


            padding: const EdgeInsets.all(25),



            child: Card(


              elevation: 10,


              shape: RoundedRectangleBorder(

                borderRadius:

                BorderRadius.circular(30),

              ),



              child: Padding(


                padding:

                const EdgeInsets.all(25),



                child: Column(


                  children: [



                    // Logo

                    Container(


                      width:90,

                      height:90,


                      decoration: BoxDecoration(


                        color:Colors.blue,


                        borderRadius:

                        BorderRadius.circular(25),


                      ),


                      child:

                      const Icon(

                        Icons.school,

                        size:50,

                        color:Colors.white,

                      ),

                    ),



                    const SizedBox(height:20),




                    const Text(

                      "Smart Discipline",

                      style:TextStyle(

                        fontSize:28,

                        fontWeight:

                        FontWeight.bold,

                      ),

                    ),



                    const SizedBox(height:5),




                    Text(

                      "Monitoring Kedisiplinan Siswa",

                      style:

                      TextStyle(

                        color:

                        Colors.grey.shade600,

                      ),

                    ),



                    const SizedBox(height:30),





                    TextField(


                      controller:

                      emailController,


                      decoration:

                      InputDecoration(


                        labelText:

                        "Email / Username",


                        prefixIcon:

                        const Icon(

                          Icons.person,

                        ),


                        border:

                        OutlineInputBorder(


                          borderRadius:

                          BorderRadius.circular(15),


                        ),

                      ),


                    ),



                    const SizedBox(height:15),





                    TextField(


                      controller:

                      passwordController,


                      obscureText:

                      !showPassword,


                      decoration:

                      InputDecoration(


                        labelText:

                        "Password",


                        prefixIcon:

                        const Icon(

                          Icons.lock,

                        ),



                        suffixIcon:

                        IconButton(


                          icon:

                          Icon(

                            showPassword

                                ?

                            Icons.visibility

                                :

                            Icons.visibility_off,

                          ),



                          onPressed:(){


                            setState(() {


                              showPassword =

                              !showPassword;


                            });


                          },


                        ),


                        border:

                        OutlineInputBorder(

                          borderRadius:

                          BorderRadius.circular(15),

                        ),

                      ),



                    ),



                    const SizedBox(height:20),




                    DropdownButtonFormField(


                      value:selectedRole,


                      decoration:

                      InputDecoration(


                        labelText:

                        "Login Sebagai",


                        prefixIcon:

                        const Icon(

                          Icons.account_circle,

                        ),


                        border:

                        OutlineInputBorder(

                          borderRadius:

                          BorderRadius.circular(15),

                        ),


                      ),



                      items:


                      [

                        "Admin",

                        "Guru",

                        "Siswa",

                        "Orang Tua"

                      ]

                          .map((role)=>


                          DropdownMenuItem(


                            value:role,


                            child:

                            Text(role),


                          )


                      )

                          .toList(),




                      onChanged:(value){


                        setState(() {


                          selectedRole =

                          value.toString();


                        });


                      },


                    ),




                    const SizedBox(height:30),




                    SizedBox(


                      width:

                      double.infinity,


                      height:55,



                      child:

                      ElevatedButton(


                        style:

                        ElevatedButton.styleFrom(


                          backgroundColor:

                          Colors.blue,


                          foregroundColor:

                          Colors.white,


                          shape:

                          RoundedRectangleBorder(


                            borderRadius:

                            BorderRadius.circular(15),


                          ),


                        ),



                        onPressed:(){



                          Navigator.pushReplacement(


                            context,


                            MaterialPageRoute(


                              builder:(context)


                              =>

                              const DashboardScreen(),


                            ),


                          );



                        },



                        child:

                        const Text(


                          "LOGIN",


                          style:

                          TextStyle(


                            fontSize:18,


                            fontWeight:

                            FontWeight.bold,


                          ),


                        ),


                      ),

                    ),




                    const SizedBox(height:15),




                    TextButton(


                      onPressed:(){},


                      child:

                      const Text(

                        "Lupa Password?",

                      ),

                    )



                  ],


                ),

              ),

            ),

          ),

        ),

      ),

    );


  }

}