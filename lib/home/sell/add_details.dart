
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roof_up/Common/common.dart';
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
  List<File> images = [];
  List<String> imageUrls = [];
  bool isLoading = false;
  late TextEditingController detailsController;

  @override
  void initState() {
    detailsController = TextEditingController(
        text: widget.data['propertyDetails'] == ''
            ? ''
            : widget.data['propertyDetails']);
    propertyData = widget.data;
    if (widget.data['imageData'] != null) {
      images = widget.data['imageData'];
    }
    print(propertyData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          name: 'Sell',
          home: false,
        ),
        body: isLoading
            ? CommonClass.loader(context)
            : Padding(
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
                                setState(() {
                                  isLoading = true;
                                });
                                res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WhatsappCamera(), // Replace this with your actual camera widget
                                  ),
                                );
                                if (images.isNotEmpty) {
                                  setState(() {
                                    images.addAll(res);
                                    isLoading = false;
                                  });
                                } else {
                                  setState(() {
                                    images = res;
                                    isLoading = false;
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: images.isNotEmpty ? 245 : 150,
                                padding: images.isNotEmpty
                                    ? EdgeInsets.all(8)
                                    : EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 4.0,
                                      spreadRadius: 3.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: images.isNotEmpty
                                    ? Column(
                                        children: [
                                          Container(
                                            height: 170,
                                            child: ReorderableListView(
                                              scrollDirection: Axis.horizontal,
                                              onReorder:
                                                  (int oldIndex, int newIndex) {
                                                setState(() {
                                                  if (newIndex > oldIndex) {
                                                    newIndex -= 1;
                                                  }
                                                  final File item =
                                                      images.removeAt(oldIndex);
                                                  images.insert(newIndex, item);
                                                });
                                              },
                                              children: [
                                                for (int index = 0;
                                                    index < images.length;
                                                    index++)
                                                  Row(
                                                    key:
                                                        ValueKey(images[index]),
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child: Container(
                                                              height: 200,
                                                              child: Image.file(
                                                                  images[
                                                                      index]),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            top: 0,
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .red
                                                                    .shade200,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    images.removeAt(
                                                                        index);
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons.delete,
                                                                  size: 15,
                                                                ),
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomButton(
                                            name: "Add More",
                                            onpressed: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              res = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const WhatsappCamera(), // Replace this with your actual camera widget
                                                ),
                                              );
                                              if (images.isNotEmpty) {
                                                setState(() {
                                                  images.addAll(res);
                                                  isLoading = false;
                                                });
                                              } else {
                                                setState(() {
                                                  images = res;
                                                  isLoading = false;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Click to upload',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        SizedBox(height: 30),
                        // Image.file(res![0]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Property Details (optional)'),
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
                                      blurRadius: 4.0,
                                      spreadRadius: 3.0,
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
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                            name: 'Next',
                            onpressed: () {
                              // addData();
                              propertyData['imageData'] = images;
                              propertyData['propertyDetails'] =
                                  detailsController.text.trim().toString();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Summary(
                                            comingFromBuy: false,
                                            uid: globals.uid,
                                            propertyData: propertyData,
                                          )));
                            })
                      ],
                    ),
                  ),
                ),
              ));
  }
}
