import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class otppage extends StatelessWidget {
  const otppage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
        width: MediaQuery.of(context).size.width,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('CO\nDE',style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                    
                  ),
                ),
                Text('Verification'.toUpperCase()),
                SizedBox(height: 40,),
                Text('Enter vertification code sent at ' +" support@foodie.com",textAlign: TextAlign.center,),
                SizedBox(height: 20,),
            
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  keyboardType: TextInputType.number,
                  onSubmit:  (code){print("OTP is => $code");},
            
                ),
                SizedBox(height: 20,),
            
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    onPressed: (){},
                    child: Text("NEXT",style: TextStyle(
                      color: Colors.blue.shade50
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}