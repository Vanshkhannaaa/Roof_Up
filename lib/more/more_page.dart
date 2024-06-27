import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/home_container.dart';
import 'package:roof_up/auth/phone_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

void _signOut(BuildContext context)async{

  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setBool('isLoggedIn', false);

  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=>PhoneLogin())
  );
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('More',
          style: TextStyle(
            fontFamily: GoogleFonts.kanit().fontFamily,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Profile',style: TextStyle(
                fontFamily: GoogleFonts.kanit().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15),
              ProfileRow(name: 'Name', iconData: Icons.person, value: 'Abhishek Ahuja'),
              SizedBox(height: 10),
              ProfileRow(name: 'Phone Number', iconData: Icons.phone, value: '9646220430'),
              SizedBox(height: 15),

              CustomButton(name: 'Sign Out', onpressed: (){
                _signOut(context);
              })

              // InkWell(
              //   onTap: (){
              //     _signOut(context);
              //   },
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.topRight,
              //         colors: [
              //           Colors.red.shade800,
              //           Colors.red.shade200
              //         ]
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.blue.shade800
              //     ),
              //     child:Text('Sign Out',textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold
              //     ),),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
