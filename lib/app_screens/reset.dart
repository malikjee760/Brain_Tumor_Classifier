
import 'package:brain_tumor_classifier_app/Services/AuhenticationServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_.dart';
import 'signup_.dart';

import 'main_page.dart';



class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset>{
  TextEditingController emailController = new TextEditingController();
  final _keyF =GlobalKey<FormState>();
  final Auth_Service _auth =Auth_Service();


  String _emailAddress = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Reset Form',
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
        body: Form(
          key: _keyF,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image(
                  image: AssetImage("images/forgotPass.png"),
                  height: 250,
                  width: 250,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: emailController,
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
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    //padding: EdgeInsets.all(15.0),
                    minWidth: double.minPositive,
                    height: 60,
                    color: Colors.lightBlue,
                    onPressed: ()
                    {
                      if(_keyF.currentState!.validate()){
                        ResetPassword();
                        
                      }
                    },
                    child: Text('RESET',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),

                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                )



              ],
            )
        ),
      ),
    );
  }

  void ResetPassword() async{

      dynamic authReset = await _auth.resetPassword(emailController.text);

        emailController.clear();
        Navigator.pop(context);
  }
}


