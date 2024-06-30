import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/common.dart';
import 'package:roof_up/Common/home_container.dart';
import 'package:roof_up/auth/phone_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  String name = '';
  String number = '';
  bool isLoading = false;

  @override
  void initState() {
    fetchDetails();
    super.initState();
  }

  void _signOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isLoggedIn', false);

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => PhoneLogin()));
  }

  void fetchDetails() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('uid')!;
    var userRef = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();
    setState(() {
      number = userRef.docs.first.data()['phoneNumber'];
      name = userRef.docs.first.data()['name'];
      isLoading = false;
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed('/nav');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'More',
            style: TextStyle(
                fontFamily: GoogleFonts.kanit().fontFamily,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? CommonClass.loader(context)
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontFamily: GoogleFonts.kanit().fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      ProfileRow(
                          name: 'Name', iconData: Icons.person, value: name),
                      SizedBox(height: 10),
                      ProfileRow(
                          name: 'Phone Number',
                          iconData: Icons.phone,
                          value: number),
                      SizedBox(height: 15),

                      CustomButton(
                          name: 'Sign Out',
                          onpressed: () {
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
      ),
    );
  }
}
