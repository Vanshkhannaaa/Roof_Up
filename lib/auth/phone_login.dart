import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otp.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _phoneController = TextEditingController();
  bool _isButtonLoading = false;

  void _verifyPhoneNumber() async {
    setState(() {
      _isButtonLoading = true;
    });

    final phoneNumber = _phoneController.text;

    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a phone number')),
      );
      setState(() {
        _isButtonLoading = false;
      });
      return;
    } else if (phoneNumber.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number')),
      );
      setState(() {
        _isButtonLoading = false;
      });
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to verify phone number: ${e.message}')),
          );
          setState(() {
            _isButtonLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _isButtonLoading = false;
          });
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => otppage(
              phoneNumber: _phoneController.text,
              verificationId: verificationId,
            ),
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _isButtonLoading = false;
          });
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
      setState(() {
        _isButtonLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    'assets/images/otp.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Phone Number Verification',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.kanit().fontFamily,
                  ),
                ),
                Text(
                  'Enter phone number for OTP',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white60,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue.shade800),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isButtonLoading ? null : _verifyPhoneNumber,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black, // Shadow color
                      elevation: 5,
                      backgroundColor: Color(0xff1877F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: _isButtonLoading
                        ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : Text('Continue',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
