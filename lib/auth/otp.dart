import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/common.dart';

class otppage extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  otppage({required this.phoneNumber, required this.verificationId});

  final _otpController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: isLoading ? CommonClass.loader(context) :Padding(
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white60,
                child: TextField(
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blue.shade800,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 10
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'OTP',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade800)
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  name: 'Submit',
                  onpressed: () async {
                    isLoading = true;
                    print(_otpController.text.trim());
                    PhoneAuthCredential cred =
                    await PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: _otpController.text.trim());
                    FirebaseAuth.instance
                        .signInWithCredential(cred)
                        .then((value) async {
                      print("hi");
                      print(value);
                      var userRef = await FirebaseFirestore.instance
                          .collection('users')
                          .add({
                        'phoneNumber': phoneNumber,
                        'name': "",
                      });
                      String id = userRef.id;
                      userRef.update({
                        'uid': id,
                      });
                      // globals.uid = id;
                      Navigator.of(context).pushNamed('/nav');
                      isLoading = false;
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