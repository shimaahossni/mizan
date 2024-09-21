import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:mizan_app/models/note_model.dart';

import '../constants.dart';
import '../database/nodesModel.dart';
import '../database/sql_helper.dart';

class Installments extends StatefulWidget {
  const Installments({super.key});

  @override
  State<Installments> createState() => _InstallmentsState();
}

class _InstallmentsState extends State<Installments> {
  TextEditingController monthController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController typingController = TextEditingController();
  List<Notes> note=[];

  loudNote()async{
    final data=await SqlHelper().loadNote();
    setState(() {
      note=data;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loudNote();
  }

  //insert data
  addNotes()async{
    Notes note=Notes(
        month: monthController.text,
        timedeliver: timeController.text,
        typeNote: typingController.text
    );
    await SqlHelper().insertNote(note as NoteModel);
    monthController.clear();
    timeController.clear();
    typingController.clear();
    loudNote();
  }

  delete(int id)async{
    SqlHelper().deleteNote(id);
    loudNote();
  }


  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
//      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(height: mediaquery.height*.4,),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/logo (2).png"),
                  ),
                  // SizedBox(height: 20,),
                  BubbleSpecialOne(
                    text:
                    'في هذه الغرفة يمكنك تحويل العملات الى قيمتها الدولارية',
                    color: kPrimaryColor2,
                    tail: true,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: kfontStyle2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaquery.height*.1,),


              //image with no request
              Column(
                children: [
                  SizedBox(height: mediaquery.height*.2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(// Image radius
                          child: Image.asset('assets/images/no quest.gif', fit: BoxFit.cover,height: mediaquery.height*.6,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.green,
       // tooltip: 'Increment',
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    //elevation: 18,
                    backgroundColor: Colors.white,

                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: 220,
                    child: Column(
                      children: [
                        TextField(
                          controller: monthController,
                        ),
                        TextField(
                          controller: timeController,
                        ),
                        TextField(
                          controller: typingController,
                        ),


                        const Text("Restart",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),),
                      ],
                    ),
                  ),
                ),

              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}