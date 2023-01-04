import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'login_.dart';
import 'signup_.dart';


class Home_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Home(),
      routes: {
        "/mainpage": (_) => new MainPage(),
      },

    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            //padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),


                 Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),


                   Text(
                              "BRAIN TUMOR CLASSIFIER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image(
                            image: AssetImage("images/ctscan.jpg"),
                             // height: 250,
                             // width: 250,
                          ),
                  ),
                ),

               MaterialButton(
                            padding: EdgeInsets.all(20.0),
                            child: Text('SIGN-IN',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                            minWidth: double.infinity,
                           // height: 50,
                            color: Colors.lightBlue,
                            onPressed: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                            },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),

                SizedBox(
                  height: 20,
                ),


             MaterialButton(
                            padding: EdgeInsets.all(20.0),
                            minWidth: double.infinity,
                            onPressed: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                            },
                            child: Text('SIGN-UP',
                              style: TextStyle(

                                fontWeight: FontWeight.w700,
                                fontSize: 20,

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
                  height: 20,
                ),

                SizedBox(
                  height: 30,
                ),


              ],
            ),
          ),
        ),

      ),
    );
  }
}

