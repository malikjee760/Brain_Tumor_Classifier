import 'dart:io';
import 'package:brain_tumor_classifier_app/Services/AuhenticationServices.dart';
import 'package:brain_tumor_classifier_app/app_screens/login_.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;


  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {

    final pickedFile = await _picker.getImage(
                source: source,
              );
              setState(() {

                _imageFile = pickedFile;
              });
            }
   Widget ImageView(){
    if(_imageFile==null){
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
               height: 250,
                width: 250,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*Icon(
                      Icons.image,
                      size: 100.0,
                    ),*/
                    Image(
                      image: AssetImage("images/NoImg.png"),
                      height: 200,
                      width: 200,
                    ),

                    Text('No Image Selected',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold

                      ),),

                  ],
                ),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                    border: Border.all(color: Colors.blueAccent)
                )

            ),
      );
    }
    else
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 250,
          width: 250,
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent)
            ),
            child: Image.file(File(_imageFile!.path),width: 250,height: 250,),
           ),
      );


   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Welcome',
            style: TextStyle(
                color: Colors.lightBlue
            ),
          ),

          actions: [
            IconButton(
              color: Colors.lightBlue,
                onPressed: (){
                  Auth_Service().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                }, icon: Icon(Icons.logout),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Form(
          child: ListView(
              children: <Widget>[

                SizedBox(
                  height: 10,
                ),
                ImageView(),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                  child: Container(
                    height: 50,
                    width: 70,
                    child: Row(
                      children: [
                        MaterialButton(
                            //padding: EdgeInsets.all(20.0),
                            child: Text('UPLOAD IMAGE',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.white
                              ),
                            ),
                            //minWidth: 70,
                             height: 50,
                            color: Colors.lightBlue,
                            onPressed: ()
                            {
                              _onImageButtonPressed(ImageSource.gallery, context: context);
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),


                SizedBox(
                      width: 34,
                    ),


                      //padding: EdgeInsets.only(left: 5.0,right: 20.0),
                      MaterialButton(
                        //padding: EdgeInsets.all(20.0),
                       // minWidth: double.infinity,
                         height: 50,
                        onPressed: ()
                        {
                          _onImageButtonPressed(ImageSource.camera, context: context);
                        },
                        child: Text('CAPTURE IMAGE',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,

                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),


                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: MaterialButton(
                    //padding: EdgeInsets.all(20.0),
                    minWidth: double.infinity,
                    color: Colors.redAccent,
                    onPressed: ()
                    {
                      _imageFile=null;
                      setState(() {
                        ImageView();
                      });


                    },
                    child: Text('REMOVE IMAGE',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,

                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: MaterialButton(
                    //padding: EdgeInsets.all(20.0),
                    minWidth: double.infinity,
                    //color: Colors.yellowAccent,
                    onPressed: ()
                    {
                      _showDialog();
                    },
                    child: Text('SHOW RESULT',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,

                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),

                ),

              ]

          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("                     RESULT"),

          content: new Text("Brain Tumor is Detected .Please visit the doctor"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

