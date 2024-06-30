import 'package:flutter/material.dart';

import 'login_form.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.blue.shade200,
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40,),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image(image: AssetImage("assets/images/logo.png"),height: 150,)),
              SizedBox(height: 30,),
              Text('Welcome Back,',style:TextStyle(fontSize:35,fontWeight:  FontWeight.bold)),
              Text('Make is work,make it right, make it fast'),

              LoginForm(),


            ],
          ),
        ),
      ),
    );
  }
}



