import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class otppage extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;
  otppage({required this.phoneNumber, required this.verificationId});

  @override
  _otppageState createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  final _otpController = TextEditingController();
  bool _isButtonLoading = false;

  Future<void> _submitOTP() async {
    setState(() {
      _isButtonLoading = true;
    });
    print(widget.phoneNumber);
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otpController.text.trim(),
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        var userRef = await FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: widget.phoneNumber)
            .get();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (userRef.docs.isEmpty) {
          print("empty");
          var user = await FirebaseFirestore.instance.collection('users').add({
            'phoneNumber': widget.phoneNumber,
            'name': "",
          });
          String id = user.id;
          await user.update({'uid': id});
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('uid', id);
          Navigator.of(context).pushNamed('/details');
        } else {
          print("empty");
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('uid', userRef.docs.first.data()['uid']);
          if (userRef.docs.first.data()['name'] == '') {
            Navigator.of(context).pushNamed('/details');
          } else {
            Navigator.of(context).pushNamed('/nav');
          }
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isButtonLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.kanit().fontFamily,
                ),
              ),
              Text(
                'Enter verification code sent to:\n+91 ${widget.phoneNumber}',
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
                    letterSpacing: 10,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'OTP',
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
                  onPressed: _isButtonLoading ? null : _submitOTP,
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black, // Shadow color
                    elevation: 5,
                    backgroundColor: Color(0xff1877F2),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
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
                      : Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
