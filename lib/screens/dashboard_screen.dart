import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {

  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor:
      Colors.grey.shade100,



      appBar: AppBar(


        backgroundColor:
        Colors.white,


        elevation:0,


        title:


        const Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[


            Text(

              "Smart Discipline",

              style:

              TextStyle(

                fontWeight:

                FontWeight.bold,

                color:

                Colors.black,

              ),

            ),



            Text(

              "Dashboard Guru",

              style:

              TextStyle(

                fontSize:12,

                color:

                Colors.grey,

              ),

            )

          ],

        ),




        actions:[


          IconButton(

            onPressed:(){},

            icon:

            const Icon(

              Icons.notifications_none,

              color:

              Colors.black,

            ),

          )

        ],


      ),





      body:


      SingleChildScrollView(


        padding:

        const EdgeInsets.all(20),



        child:

        Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[




            // welcome


            const Text(

              "Selamat Datang 👋",

              style:

              TextStyle(

                fontSize:25,

                fontWeight:

                FontWeight.bold,

              ),

            ),



            const SizedBox(height:5),




            Text(

              "Pantau kedisiplinan siswa dengan mudah",

              style:

              TextStyle(

                color:

                Colors.grey.shade600,

              ),

            ),





            const SizedBox(height:25),






            // Statistik


            Row(


              children:[



                statisticCard(

                  "Siswa",

                  "350",

                  Icons.people,

                  Colors.blue,

                ),




                const SizedBox(width:15),



                statisticCard(

                  "Pelanggaran",

                  "125",

                  Icons.warning,

                  Colors.red,

                ),



              ],


            ),






            const SizedBox(height:15),






            Row(


              children:[



                statisticCard(

                  "Total Poin",

                  "540",

                  Icons.score,

                  Colors.orange,

                ),




                const SizedBox(width:15),



                statisticCard(

                  "Status",

                  "Aktif",

                  Icons.check_circle,

                  Colors.green,

                ),



              ],


            ),







            const SizedBox(height:30),






            const Text(


              "Menu Utama",


              style:

              TextStyle(

                fontSize:22,

                fontWeight:

                FontWeight.bold,

              ),

            ),






            const SizedBox(height:15),







            GridView.count(


              shrinkWrap:true,


              physics:

              const NeverScrollableScrollPhysics(),




              crossAxisCount:2,



              crossAxisSpacing:15,


              mainAxisSpacing:15,



              children:[





                menuCard(

                  context,

                  Icons.people,

                  "Data Siswa",

                ),






                menuCard(

                  context,

                  Icons.add_circle,

                  "Input Pelanggaran",

                ),






                menuCard(

                  context,

                  Icons.history,

                  "Riwayat",

                ),






                menuCard(

                  context,

                  Icons.bar_chart,

                  "Laporan",

                ),





              ],


            )



          ],


        ),


      ),




      bottomNavigationBar:


      NavigationBar(


        selectedIndex:0,



        destinations:[



          const NavigationDestination(

            icon:

            Icon(Icons.home),

            label:"Home",

          ),



          const NavigationDestination(

            icon:

            Icon(Icons.assignment),

            label:"Laporan",

          ),



          const NavigationDestination(

            icon:

            Icon(Icons.person),

            label:"Profile",

          ),



        ],


      ),



    );

  }






  Widget statisticCard(

      String title,

      String value,

      IconData icon,

      Color color

      ){


    return Expanded(


      child:


      Container(


        padding:

        const EdgeInsets.all(18),



        decoration:

        BoxDecoration(


          color:

          Colors.white,


          borderRadius:

          BorderRadius.circular(20),


          boxShadow:[


            BoxShadow(

              color:

              Colors.grey.shade300,

              blurRadius:8,

            )

          ],


        ),



        child:


        Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[



            CircleAvatar(


              backgroundColor:

              color.withOpacity(0.15),


              child:

              Icon(

                icon,

                color:

                color,

              ),

            ),



            const SizedBox(height:15),



            Text(


              value,


              style:

              const TextStyle(

                fontSize:28,

                fontWeight:

                FontWeight.bold,

              ),


            ),



            Text(


              title,


              style:

              TextStyle(

                color:

                Colors.grey.shade600,

              ),

            )



          ],


        ),


      ),


    );

  }






  Widget menuCard(

      BuildContext context,

      IconData icon,

      String title

      ){



    return Container(



      decoration:

      BoxDecoration(


        color:

        Colors.white,


        borderRadius:

        BorderRadius.circular(20),


      ),




      child:


      InkWell(


        borderRadius:

        BorderRadius.circular(20),



        onTap:(){



          // halaman berikutnya



        },



        child:


        Column(


          mainAxisAlignment:

          MainAxisAlignment.center,



          children:[



            CircleAvatar(


              radius:30,


              child:

              Icon(

                icon,

                size:30,

              ),


            ),




            const SizedBox(height:12),




            Text(

              title,

              textAlign:

              TextAlign.center,


            )



          ],


        ),


      ),



    );


  }



}