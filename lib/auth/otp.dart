import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';

class otppage extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  otppage({required this.phoneNumber, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    String otp = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Verification Code',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.kanit().fontFamily)),
              Text(
                'Enter vertification code sent at : \n' + "+91 $phoneNumber",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
              ),
              SizedBox(height: 20),
              OtpTextField(),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (code) {
                  print("OTP is => $code");
                  otp = code;
                },
                cursorColor: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(20),
                autoFocus: true,
                focusedBorderColor: Colors.blue.shade800,
                borderColor: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  name: 'Submit',
                  onpressed: () async {
                    PhoneAuthCredential cred =
                    await PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: otp);
                    FirebaseAuth.instance
                        .signInWithCredential(cred)
                        .then((value) async {
                      print("hi");
                      print(value);
                      var userRef = await FirebaseFirestore.instance
                          .collection('users')
                          .add({
                        'phoneNumber': phoneNumber,
                      });
                      String id = userRef.id;
                      userRef.update({
                        'uid': id,
                      });
                      // globals.uid = id;
                      Navigator.of(context).pushNamed('/nav');
                    });
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}