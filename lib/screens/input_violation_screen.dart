import 'package:flutter/material.dart';


class InputViolationScreen extends StatefulWidget {

  const InputViolationScreen({super.key});


  @override
  State<InputViolationScreen> createState() =>
      _InputViolationScreenState();

}



class _InputViolationScreenState
    extends State<InputViolationScreen> {


  String? selectedStudent;

  String? selectedViolation;


  DateTime selectedDate = DateTime.now();



  final descriptionController =
      TextEditingController();



  final students = [

    "Ahmad Fadholi",
    "Adrian Auliansyah",
    "Addin Dailami",
    "Budi Santoso"

  ];



  final violations = [

    "Terlambat (5 poin)",
    "Tidak memakai atribut (10 poin)",
    "Perkelahian (50 poin)"

  ];





  Future chooseDate() async {


    final date =
    await showDatePicker(

      context: context,

      firstDate:
      DateTime(2025),

      lastDate:
      DateTime(2030),

      initialDate:
      selectedDate,

    );



    if(date != null){

      setState(() {

        selectedDate = date;

      });

    }


  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:

        const Text(

          "Input Pelanggaran",

          style:

          TextStyle(

            fontWeight: FontWeight.bold

          ),

        ),

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



            Container(

              width:

              double.infinity,


              padding:

              const EdgeInsets.all(20),


              decoration:

              BoxDecoration(

                color:

                Colors.blue.shade50,


                borderRadius:

                BorderRadius.circular(20),

              ),



              child:

              const Column(

                children:[

                  Icon(

                    Icons.warning_amber,

                    size:50,

                    color:Colors.orange,

                  ),


                  SizedBox(height:10),


                  Text(

                    "Catat Pelanggaran Siswa",

                    style:

                    TextStyle(

                      fontSize:20,

                      fontWeight:

                      FontWeight.bold,

                    ),

                  ),

                  Text(

                    "Masukkan data kejadian dengan lengkap",

                    textAlign:

                    TextAlign.center,

                  )

                ],

              ),

            ),




            const SizedBox(height:25),




            const Text(

              "Nama Siswa",

              style:

              TextStyle(

                fontWeight:

                FontWeight.bold,

              ),

            ),



            const SizedBox(height:8),




            DropdownButtonFormField(


              value:selectedStudent,


              decoration:

              InputDecoration(

                border:

                OutlineInputBorder(

                  borderRadius:

                  BorderRadius.circular(15),

                ),

                prefixIcon:

                const Icon(Icons.person),

              ),



              hint:

              const Text(

                "Pilih siswa"

              ),



              items:


              students.map((student){


                return DropdownMenuItem(

                  value:student,

                  child:

                  Text(student),

                );


              }).toList(),



              onChanged:(value){


                setState(() {


                  selectedStudent =
                      value.toString();


                });


              },


            ),






            const SizedBox(height:20),






            const Text(

              "Jenis Pelanggaran",

              style:

              TextStyle(

                fontWeight:

                FontWeight.bold,

              ),

            ),




            const SizedBox(height:8),





            DropdownButtonFormField(


              value:selectedViolation,


              decoration:

              InputDecoration(

                border:

                OutlineInputBorder(

                  borderRadius:

                  BorderRadius.circular(15),

                ),

                prefixIcon:

                const Icon(Icons.warning),

              ),



              hint:

              const Text(

                "Pilih pelanggaran"

              ),



              items:


              violations.map((item){


                return DropdownMenuItem(

                  value:item,

                  child:

                  Text(item),

                );


              }).toList(),




              onChanged:(value){


                setState(() {


                  selectedViolation =

                  value.toString();


                });


              },


            ),







            const SizedBox(height:20),







            const Text(

              "Tanggal Kejadian",

              style:

              TextStyle(

                fontWeight:

                FontWeight.bold,

              ),

            ),




            const SizedBox(height:8),





            InkWell(


              onTap:chooseDate,



              child:

              Container(


                padding:

                const EdgeInsets.all(15),


                decoration:

                BoxDecoration(

                  border:

                  Border.all(

                    color:

                    Colors.grey,

                  ),


                  borderRadius:

                  BorderRadius.circular(15),

                ),



                child:

                Row(


                  children:[


                    const Icon(

                      Icons.calendar_month,

                    ),



                    const SizedBox(width:10),



                    Text(

                      "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"

                    )

                  ],


                ),

              ),



            ),






            const SizedBox(height:20),





            const Text(

              "Keterangan",

              style:

              TextStyle(

                fontWeight:

                FontWeight.bold,

              ),

            ),




            const SizedBox(height:8),




            TextField(


              controller:

              descriptionController,



              maxLines:4,



              decoration:

              InputDecoration(

                hintText:

                "Masukkan detail kejadian...",


                border:

                OutlineInputBorder(

                  borderRadius:

                  BorderRadius.circular(15),

                ),

              ),

            ),






            const SizedBox(height:20),







            Container(


              width:

              double.infinity,


              height:120,


              decoration:

              BoxDecoration(

                color:

                Colors.grey.shade200,


                borderRadius:

                BorderRadius.circular(20),

              ),



              child:

              const Column(

                mainAxisAlignment:

                MainAxisAlignment.center,


                children:[


                  Icon(

                    Icons.camera_alt,

                    size:40,

                  ),


                  SizedBox(height:10),



                  Text(

                    "Upload Bukti Foto",

                  )


                ],

              ),


            ),






            const SizedBox(height:30),





            SizedBox(


              width:

              double.infinity,


              height:55,



              child:

              ElevatedButton(


                onPressed:(){



                  ScaffoldMessenger.of(context)

                      .showSnackBar(


                    const SnackBar(

                      content:

                      Text(

                        "Data pelanggaran berhasil disimpan"

                      ),

                    ),

                  );


                },



                child:

                const Text(

                  "SIMPAN PELANGGARAN",

                  style:

                  TextStyle(

                    fontSize:16,

                    fontWeight:

                    FontWeight.bold,

                  ),

                ),



              ),


            )




          ],


        ),


      ),


    );


  }


}