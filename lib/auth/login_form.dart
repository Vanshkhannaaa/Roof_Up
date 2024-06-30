import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common/textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  // void authenticateUser(BuildContext context) async{
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: loginIDController.text,
  //         password: passwordController.text
  //     );
  //
  //     print("User ID is:${userCredential.user!.uid}");
  //
  //     if(userCredential.user!.uid.toString().isNotEmpty){
  //       Navigator.pushReplacementNamed(context, "/nav");
  //     }else{
  //       setState(() {
  //         showLoader=false;
  //
  //       });
  //     }
  //
  //
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  TextEditingController loginIDController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _obscureText = true;
  bool showLoader = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool _obscureText =true;
    return Form(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: loginIDController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  cursorColor: Colors.blue,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline_outlined),
                      labelText: "E-Mail",
                      hintText: "E-Mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                      )
                  )
              ),
              SizedBox(height: 15,),
              TextFormField(
                  controller: passwordController,
                  cursorColor: Colors.blue,
                  obscureText: _obscureText,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      labelText: "Password",
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)

                      ),
                      suffixIcon: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.remove_red_eye_outlined),
                      )

                  )
              ),

              const SizedBox(height: 20,),
              SizedBox(
                  width: double.infinity,
                  child:
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, "/home");

                      }, child: Text('login'.toUpperCase(),style: TextStyle(color: Colors.white),)
                  )
                  )
            ],
          ),
        )

    );
  }
}