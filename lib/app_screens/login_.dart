import 'package:brain_tumor_classifier_app/Services/AuhenticationServices.dart';
import 'package:brain_tumor_classifier_app/app_screens/HomeScreen.dart';
import 'package:brain_tumor_classifier_app/app_screens/reset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'signup_.dart';

import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<LoginPage>{
  final _key =GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final Auth_Service _auth =Auth_Service();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          title: Text('Login Form',
            style: TextStyle(
                color: Colors.lightBlue
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.lightBlue,
          ),

        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _key,
              child: ListView(
               children: <Widget>[
                 SizedBox(
                   height: 20,
                 ),
                 Image(
                     image: AssetImage("images/login.png"),
                   height: 250,
                   width: 250,
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                     controller: _email,
                     key: ValueKey('email'),
                     validator: (value){
                       if(value!.isEmpty || !value.contains('@')){
                         return 'Please enter a valid email';
                       }
                       return null;
                     },

                     decoration: InputDecoration(
                         errorStyle: TextStyle(
                             color: Colors.redAccent,
                             fontSize: 15.0
                         ),
                         prefixIcon: Icon(
                           Icons.email,
                           color: Colors.grey,
                         ),
                         hintText: 'Email Address',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(50.0)
                         ),

                     ),
                   ),
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                     controller: _password,
                     key: ValueKey('Password'),
                     validator: (value){
                       if(value!.isEmpty || value.length <7){
                         return 'Please enter a valid password';
                       }
                       return null;
                     },

                     decoration: InputDecoration(
                         prefixIcon: Icon(
                           Icons.lock,
                           color: Colors.grey,
                         ),
                         suffixIcon: GestureDetector(
                           onTap: (){
                            setState(() {
                              _obscureText =!_obscureText;
                            });
                           },
                           child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                         ),
                         hintText: 'Password',
                         errorStyle: TextStyle(
                             color: Colors.redAccent,
                             fontSize: 15.0
                         ),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(50.0)
                         )
                     ),
                     obscureText: _obscureText,
                   ),
                 SizedBox(
                   height: 5,
                 ),
                  GestureDetector(
                     onTap: () {
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Reset(),));
                     },
                     child: Text(
                       'Forgot Password?',
                       textAlign: TextAlign.end,
                       style: TextStyle(
                           fontSize: 15.0,
                         fontWeight: FontWeight.w400
                       ),


                     ),
                   ),
                 SizedBox(
                   height: 20,
                 ),

                  MaterialButton(

                       minWidth: double.minPositive,
                        height: 60,
                       color: Colors.lightBlue,
                       onPressed: () {
                         if(_key.currentState!.validate()){
                           SignInUser();
                         }
                       },
                         child:
                         Text('ENTER',
                           style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 20,
                               color: Colors.white
                           ),
                         ),

                         shape:
                         RoundedRectangleBorder(
                           side: BorderSide(
                             color: Colors.black,
                           ),
                           borderRadius: BorderRadius.circular(50),
                         ),

                       ),
                 SizedBox(
                   height: 20,
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                         'Dont have an Account?',
                         style: TextStyle(
                           fontSize: 15.0
                         ),
                       ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp(),));
                        },
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),


                        ),
                      ),

                    ],
                  ),
                 SizedBox(
                   height: 20,
                 )



               ],
              )
          ),
        ) ,
        ),

    );
  }

  void SignInUser() async{
    dynamic authResult = await _auth.SignIn(_email.text,_password.text );
    if(authResult == null){
      _showDialog();
    }else{
      _email.clear();
      _password.clear();
      print("SignIn SuccessFull");
      Navigator.pushReplacementNamed(context, "/mainpage");
      //Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));

    }
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("                     Error"),

          content: new Text("Please Enter Correct Email and Password"),
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
