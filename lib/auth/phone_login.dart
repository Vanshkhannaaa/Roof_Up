import 'package:flutter/material.dart';

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
    return Material(
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

        child: Form(
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 80,horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image(image: AssetImage("assets/images/logo.png"),height: 150,)),
                    SizedBox(height: 30,),
                    Text('Welcome Back,',style:TextStyle(fontSize:35,fontWeight:  FontWeight.bold)),
                    Text('Make is work,make it right, make it fast'),
                    SizedBox(height: 30,),
                    TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        cursorColor: Colors.blue,
                        decoration:  InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone Number",
                            hintText: "Phone-No",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                
                            )
                        )
                    ),
                    SizedBox(height: 15,),
                
                    const SizedBox(height: 20,),
                    SizedBox(
                        width: double.infinity,
                        child:
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: _navigateToOtpPage,
                            child: Text('Send Otp'.toUpperCase(),style: TextStyle(color: Colors.white),)
                        )
                    )
                
                  ],
                ),
              ),
            )

        ),
      ),
    );
  }
}
