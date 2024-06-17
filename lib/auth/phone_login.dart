import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'otp.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}
class _PhoneLoginState extends State<PhoneLogin> {
  final _phoneController = TextEditingController();

  void _navigateToOtpPage() {
    final phoneNumber = _phoneController.text;
    if (phoneNumber.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => otppage(phoneNumber: phoneNumber),
        ),
      );
    } else {
      // Show error if phone number is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a phone number')),
      );
    }
  }
  Widget build(BuildContext context) {

    bool _obscureText =true;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),

                Center(
                  child: Image.asset('assets/images/otp.png',
                    height: MediaQuery.of(context).size.height*0.35,),
                ),

                SizedBox(height: 30),

                Text('OTP Verification',
                  style:TextStyle(
                    fontSize:20,
                    fontWeight:FontWeight.w600,
                    fontFamily: GoogleFonts.kanit().fontFamily
                  )
                ),
                Text('Enter phone number for OTP',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white60,
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Enter Phone Number',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade700)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue.shade800)
                        )
                    ),
                  ),
                ),

                SizedBox(height: 20),

                CustomButton(name: 'Continue', onpressed: (){
                  _navigateToOtpPage();
                }),

                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
