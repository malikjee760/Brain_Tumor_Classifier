
import 'package:brain_tumor_classifier_app/Services/AuhenticationServices.dart';
import 'package:brain_tumor_classifier_app/Services/verifyEmail.dart';
import 'package:flutter/material.dart';
import 'login_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignUp extends StatefulWidget {

  @override
  _Sign_UpState createState() => _Sign_UpState();
}

class _Sign_UpState extends State<SignUp> {
  final Auth_Service _authn =Auth_Service();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var _formkey =GlobalKey<FormState>();
  bool _obscureText = true;

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('SignUp Form',
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
          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
          child: Form(
            key: _formkey,
              child: ListView(
                children: <Widget>[

                  Image(
                    image: AssetImage("images/signup.png"),
                    height: 250,
                    width: 250,
                  ),

                   TextFormField(
                      controller: _nameController,

                      validator: (value){
                        if(value!.isEmpty ){
                          return 'Please enter a valid name';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),

                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)
                          )
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _emailController,
                      key: ValueKey('email'),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter a valid email';
                        }
                       // return null;
                      },
                    decoration: InputDecoration(
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),

                          labelText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)
                          )
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                      controller: _passwordController,
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
                                _obscureText= !_obscureText;
                              });
                            },
                            child: Icon(_obscureText ? Icons.visibility_off :Icons.visibility),

                          ),
                          labelText: 'Password',
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)
                          )
                      ),
                      obscureText: _obscureText,
                    ),
                  SizedBox(
                    height: 20,
                  ),
                   MaterialButton(
                      //padding: EdgeInsets.all(15.0),
                      minWidth: double.minPositive,
                      height: 60,
                      color: Colors.lightBlue,
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          createUser();

                        }
                      },
                      child: Text('REGISTER',
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'By Clicking you are Agree to terms & conditios.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account?',
                        style: TextStyle(
                            fontSize: 15.0
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage(),));
                        },
                        child: Text(
                          'LOGIN',
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
                    height: 30,
                  ),



                ],
              )
          ),
        ),
      ),
    );
  }

  void createUser() async {
    dynamic result= await _authn.createAccount(_emailController.text.toString().trim(), _passwordController.text.toString().trim());

    if(result == null){
      print('Email is not valid');
    }else{
      print(result.toString());
      _emailController.clear();
      _nameController.clear();
      _passwordController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyScreen(),));
    }
  }
}
