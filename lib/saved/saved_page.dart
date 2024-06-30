import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/common.dart';
import 'package:roof_up/Common/search_bar.dart';
import 'package:roof_up/home/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Common/globals.dart' as globals;
import '../home/sell/summary.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  List<Map<String, dynamic>> allProperties = [];
  bool isLoading = false;
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  Map<String, bool> toggleFavorite = {};
  Map<String, int> currentIndexMap = {};

  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  void fetchProperties() async {
    setState(() {
      isLoading = true;
    });
    toggleFavorite.clear();
    allProperties.clear();
    var propertyRef = await FirebaseFirestore.instance
        .collectionGroup('property')
        .where('addToFavourite', isEqualTo: true)
        .get();
    if (propertyRef.docs.isNotEmpty) {
      setState(() {
        propertyRef.docs.forEach((property) {
          toggleFavorite[property['propertyId']] = property['addToFavourite'];
          allProperties.add(property.data());
          currentIndexMap[property['propertyId']] = 0;
        });
      });
    }
    print(allProperties);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchProperties();
    super.initState();
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed('/nav');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Saved',
                style: TextStyle(
                    fontFamily: GoogleFonts.kanit().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: isLoading
                ? CommonClass.loader(context)
                : allProperties.isEmpty
                    ? Center(
                        child: Text("No property found"),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            CustomSearchBar(),
                            SizedBox(height: 15),
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
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    margin: EdgeInsets.all(8),
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
                                                                .grey.shade200
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
                                                                    .grey
                                                                    .shade800,
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
                                                                .grey.shade200
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
                                                                    .grey
                                                                    .shade800,
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
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '\u20b9 ${allProperties[index]['value']}',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            GoogleFonts.kanit()
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
                                                                  isLoading =
                                                                      true;
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

                                                                fetchProperties();
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
                                );
                              },
                            ),
                          ],
                        ),
                      )),
        onWillPop: _onWillPop);
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
}
