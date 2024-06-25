import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roof_up/home/sell/summary.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';
import '../../Common/globals.dart' as globals;
import '../../Common/TextField.dart';
import '../../Common/appBar.dart';

class AddDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  const AddDetails({super.key, required this.data});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  Map<String, dynamic> propertyData = {};
  List<File> res = [];
  List<String> imageUrls = [];

  @override
  void initState() {
    propertyData = widget.data;
    print(propertyData);
    super.initState();
  }

  void addData() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    print(id);
    FirebaseStorage storageRef = FirebaseStorage.instance;
    if (res.isNotEmpty) {
      await Future.forEach(res, (image) async {
        String fileName =
            'properties/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await storageRef.ref(fileName).putFile(image);
        String downloadURL = await storageRef.ref(fileName).getDownloadURL();
        setState(() {
          imageUrls.add(downloadURL);
        });
      });
    }
    print(imageUrls);

    var docRef = await FirebaseFirestore.instance
        .collection("users")
        .doc(globals.uid)
        .collection('property')
        .add({
      'area': propertyData['area'],
      'value': propertyData['value'],
      'year': propertyData['year'],
      'loan': propertyData['loan'],
      'floor': propertyData['floor'],
      'property': propertyData['property'],
      'bedroom': propertyData['bedroom'],
      'bathroom': propertyData['bathroom'],
      'mobile': propertyData['mobile'],
      'facing': propertyData['facing'],
      'availability': propertyData['availability'],
      'furnishingDetails': propertyData['furnishingDetails'],
      'imageUrl': imageUrls,
      'areaUnit': propertyData['areaUnit'],
      'addToFavourite': false,
    });
    String idd = docRef.id;
    docRef.update({
      'propertyId': idd,
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Summary(
              comingFromBuy: false,
              uid: globals.uid,
              propertyId: idd,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          name: 'Sell',
          home: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20, right: 20),
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
                        onTap: () async {
                          res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WhatsappCamera(),
                            ),
                          );
                          print(res[0].toString().split('/')[5]);
                        },
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
                              borderRadius: BorderRadius.circular(10)),
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
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Click to upload',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Image.file(res![0]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Property Details (optional)'),
                      SizedBox(height: 10),
                      Container(
                        padding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          maxLength: 5000,
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                      name: 'Next',
                      onpressed: () {
                        addData();
                      })
                ],
              ),
            ),
          ),
        ));
  }
}