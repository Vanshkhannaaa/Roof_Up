import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/common.dart';
import 'package:roof_up/Common/loadingSkeleton.dart';
import 'package:roof_up/home/sell/summary.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Common/search_bar.dart';
import '../../../Common/globals.dart' as globals;

class FeedPage extends StatefulWidget {
  final String propertyType;
  const FeedPage({super.key, required this.propertyType});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Map<String, dynamic>> allProperties = [];
  bool isLoading = false;
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  Map<String, bool> toggleFavorite = {};
  Map<String, int> currentIndexMap = {};

  void fetchProperties() async {
    isLoading = true;
    String actualType = widget.propertyType.toLowerCase();
    var propertyRef;
    if (actualType == 'residential plot') {
      propertyRef = await FirebaseFirestore.instance
          .collectionGroup('property')
          .where('plotType', isEqualTo: actualType)
          .get();
    } else if (actualType == 'commercial plot') {
      propertyRef = await FirebaseFirestore.instance
          .collectionGroup('property')
          .where('plotType', isEqualTo: actualType)
          .get();
    } else if (actualType == 'factory plot') {
      propertyRef = await FirebaseFirestore.instance
          .collectionGroup('property')
          .where('plotType', isEqualTo: actualType)
          .get();
    } else if (actualType == 'shop plot') {
      propertyRef = await FirebaseFirestore.instance
          .collectionGroup('property')
          .where('plotType', isEqualTo: actualType)
          .get();
    } else {
      propertyRef = await FirebaseFirestore.instance
          .collectionGroup('property')
          .where('propertyType', isEqualTo: actualType)
          .get();
    }

    if (propertyRef.docs.isNotEmpty) {
      setState(() {
        propertyRef.docs.forEach((property) {
          toggleFavorite[property['propertyId']] = property['addToFavourite'];
          currentIndexMap[property['propertyId']] = 0;
          allProperties.add(property.data());
        });
      });
    }
    isLoading = false;
    setState(() {});
    print(currentIndexMap);
  }

  @override
  void initState() {
    fetchProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.propertyType,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SmallSearchBar(),
                        SizedBox(height: 20),
                        isLoading ?
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Loadingskeleton(),
                              SizedBox(height: 15),
                              Loadingskeleton(),
                            ],
                          ),
                        )
                            : allProperties.isEmpty
                            ? Center(
                          child: Text("No properties found"),
                        ):
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: allProperties.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Summary(
                                            comingFromBuy: true,
                                            uid: globals.uid,
                                            propertyId: allProperties[index]
                                                ['propertyId'])));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 4.0,
                                            spreadRadius: 3.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            CarouselSlider(
                                              items: allProperties[index]
                                                      ['imageUrl']
                                                  .map<Widget>((imageUrl) {
                                                // List<dynamic> imageUrls =
                                                //     propertyMap['imageUrl'] ?? [];
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.24,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      imageUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              options: CarouselOptions(
                                                height: 220.0,
                                                aspectRatio: 2,
                                                viewportFraction: 1,
                                                initialPage: 0,
                                                autoPlayInterval:
                                                    const Duration(seconds: 5),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                onPageChanged:
                                                    (indexx, reason) {
                                                  setState(() {
                                                    currentIndexMap[
                                                            allProperties[index]
                                                                [
                                                                'propertyId']] =
                                                        indexx;
                                                    // _currentIndex = index;
                                                  });
                                                },
                                              ),
                                              carouselController:
                                                  _carouselController,
                                            ),
                                            Positioned(
                                              bottom: 5,
                                              left: 5,
                                              child: Row(
                                                children: [
                                                  allProperties[index]
                                                          .containsKey(
                                                              'furnishingDetails')
                                                      ? Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue.shade800
                                                                .withOpacity(
                                                                    0.9),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                            allProperties[index]
                                                                [
                                                                'furnishingDetails'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          width: 0,
                                                          height: 0,
                                                        ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  allProperties[index]
                                                          .containsKey(
                                                              'availability')
                                                      ? Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue.shade800
                                                                .withOpacity(
                                                                    0.9),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                            allProperties[index]
                                                                [
                                                                'availability'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          width: 0,
                                                          height: 0,
                                                        ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              right: 5,
                                              top: 5,
                                              child: Center(
                                                child: _buildNumericIndicator(
                                                    allProperties[index]
                                                        ['imageUrl'],
                                                    allProperties[index]
                                                        ['propertyId']),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '\u20b9 ${allProperties[index]['value']}',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .kanit()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 24),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Built in ${allProperties[index]['year']}, ${allProperties[index]['facing']} facing",
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                    ),
                                                    Text(
                                                      '${allProperties[index]['area']} ${allProperties[index]['areaUnit']} ${allProperties[index].containsKey('bedroom') ? '(${allProperties[index]['bedroom']} BHK)' : ''}',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey),
                                                    ),
                                                    Text(
                                                      'Sec 32-A, Ldh',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Stack(
                                                        // mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          IconButton(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          8),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  // isLoading = true;
                                                                  if (toggleFavorite[
                                                                          allProperties[index]
                                                                              [
                                                                              'propertyId']] ==
                                                                      true) {
                                                                    toggleFavorite[
                                                                        allProperties[index]
                                                                            [
                                                                            'propertyId']] = false;
                                                                  } else {
                                                                    toggleFavorite[
                                                                        allProperties[index]
                                                                            [
                                                                            'propertyId']] = true;
                                                                  }
                                                                });
                                                                var propertyRef = await FirebaseFirestore
                                                                    .instance
                                                                    .collectionGroup(
                                                                        'property')
                                                                    .where(
                                                                        'propertyId',
                                                                        isEqualTo:
                                                                            allProperties[index]['propertyId'])
                                                                    .get();
                                                                propertyRef
                                                                    .docs
                                                                    .first
                                                                    .reference
                                                                    .update({
                                                                  'addToFavourite':
                                                                      toggleFavorite[
                                                                          allProperties[index]
                                                                              [
                                                                              'propertyId']],
                                                                });
                                                              },
                                                              icon: Icon(
                                                                toggleFavorite[allProperties[index]
                                                                            [
                                                                            'propertyId']] ==
                                                                        true
                                                                    ? Icons
                                                                        .favorite
                                                                    : Icons
                                                                        .favorite_outline_rounded,
                                                                color: toggleFavorite[allProperties[index]
                                                                            [
                                                                            'propertyId']] ==
                                                                        true
                                                                    ? Colors
                                                                        .pink
                                                                        .shade400
                                                                    : Colors
                                                                        .black,
                                                              )),
                                                          Positioned(
                                                            bottom: -4,
                                                            left:
                                                                Checkbox.width *
                                                                    0.5,
                                                            child: Text(
                                                              'Save',
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Stack(
                                                        children: [
                                                          IconButton(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          8),
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .share_rounded)),
                                                          Positioned(
                                                            bottom: -4,
                                                            left:
                                                                Checkbox.width *
                                                                    0.5,
                                                            child: Text('Share',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .blue
                                                              .shade800, // Background color
                                                          shadowColor: Colors
                                                              .black, // Shadow color
                                                          elevation:
                                                              5, // Elevation
                                                          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10), // Rounded corners
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          final Uri call = Uri(
                                                              scheme: 'tel',
                                                              path:
                                                                  '+91${allProperties[index]['mobile']}');

                                                          if (await canLaunchUrl(
                                                              call)) {
                                                            await launchUrl(
                                                                call);
                                                          } else {
                                                            throw 'Could not launch $call';
                                                          }
                                                        },
                                                        child: Text(
                                                          'Call',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildNumericIndicator(List<dynamic> imageList, String propertyId) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200.withOpacity(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${currentIndexMap[propertyId]! + 1}/${imageList.length}',
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildDotIndicator(List<dynamic> imageList) {
  //   return IntrinsicWidth(
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.grey.withOpacity(0.5),
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: imageList.asMap().entries.map((entry) {
  //           return InkWell(
  //             onTap: () => _carouselController.animateToPage(entry.key),
  //             child: Container(
  //               width: 6.0, // Adjust size for better visibility
  //               height: 6.0,
  //               margin:
  //                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color:
  //                     (_currentIndex == entry.key ? Colors.white : Colors.grey)
  //                         .withOpacity(0.8), // Use more prominent color
  //               ),
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }
}

Widget _buildCarouselItem(BuildContext context, String imageUrl) {
  return Builder(
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}
