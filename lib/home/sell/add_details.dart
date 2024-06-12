import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Common/TextField.dart';
import '../../Common/appBar.dart';


class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Sell',),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add Property Photos (optional)'),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4.0,
                                spreadRadius: 3.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_rounded,
                                  color: Colors.black38,
                                  size: 35,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Add Photo/Video',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black38,
                                  ),)
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Click to upload',
                              style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Property Details (optional)'),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 4.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        maxLength: 5000,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomButton(name: 'Submit',
                    onpressed:(){}
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
