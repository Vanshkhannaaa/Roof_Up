import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/appBar.dart';
import 'package:roof_up/Common/home_container.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Report Problem', home: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "What's Wrong",
                style: TextStyle(
                  fontFamily: GoogleFonts.kanit()
                      .fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
          
              Divider(),
          
              ReportRow(name: 'Location', iconData: Icons.location_on_rounded),
              ReportRow(name: 'Fake Photo', iconData: Icons.image),
              ReportRow(name: 'Property Info', iconData: Icons.info),
              ReportRow(name: 'Price', iconData: Icons.money_off_csred_rounded),
              ReportRow(name: 'Others', iconData: Icons.help_rounded),
          
              SizedBox(height: 10,),
              Text(
                "Description (optional)",
                style: TextStyle(
                  fontFamily: GoogleFonts.kanit()
                      .fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
          
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(
                    left: 10, right: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: detailsController,
                  maxLines: null,
                  expands: true,
                  maxLength: 5000,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              
              SizedBox(height: 10),
          
              CustomButton(name: 'Report', onpressed: (){}),

              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}
