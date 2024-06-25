import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/home/sell/summary.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Common/search_bar.dart';
import '../../../Common/globals.dart' as globals;

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Map<String, dynamic>> allProperties = [];
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  Map<String, bool> toggleFavorite = {};
  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  void fetchProperties() async {
    var propertyRef =
    await FirebaseFirestore.instance.collectionGroup('property').get();
    if (propertyRef.docs.isNotEmpty) {
      setState(() {
        propertyRef.docs.forEach((property) {
          toggleFavorite[property['propertyId']] = false;
          allProperties.add(property.data());
        });
      });
    }
    print(allProperties);
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
          'House',
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
                        children: [
                          Stack(
                            children: [
                              CarouselSlider(
                                items: allProperties[index]['imageUrl']
                                    .map<Widget>((imageUrl) {
                                  // List<dynamic> imageUrls =
                                  //     propertyMap['imageUrl'] ?? [];
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.24,
                                    child: ClipRRect(
                                      borderRadius : BorderRadius.circular(10),
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
                                  autoPlayInterval: const Duration(seconds: 5),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                carouselController: _carouselController,
                              ),
                              Positioned(
                                top: 160,
                                left: 5,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade800,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        allProperties[index]
                                        ['furnishingDetails'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade800,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        allProperties[index]['availability'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0, // Align at the bottom
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: _buildDotIndicator(),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\u20b9 ${allProperties[index]['value']}',
                                      style: TextStyle(
                                          fontFamily:
                                          GoogleFonts.kanit().fontFamily,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      '${allProperties[index]['area']} ${allProperties[index]['areaUnit']} (${allProperties[index]['bedroom']}BHK)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      'Sec 32-A, Ldh',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisSize : MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    if (toggleFavorite[
                                                    allProperties[index]
                                                    ['propertyId']] ==
                                                        true) {
                                                      toggleFavorite[
                                                      allProperties[index]
                                                      ['propertyId']] =
                                                      false;
                                                    } else {
                                                      toggleFavorite[
                                                      allProperties[index]
                                                      ['propertyId']] =
                                                      true;
                                                    }
                                                  });
                                                  await FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(globals.uid)
                                                      .collection('property')
                                                      .doc(allProperties[index]
                                                  ['propertyId'])
                                                      .set({
                                                    'area': allProperties[index]
                                                    ['area'],
                                                    'value': allProperties[index]
                                                    ['value'],
                                                    'year': allProperties[index]
                                                    ['year'],
                                                    'loan': allProperties[index]
                                                    ['loan'],
                                                    'floor': allProperties[index]
                                                    ['floor'],
                                                    'property': allProperties[index]
                                                    ['property'],
                                                    'bedroom': allProperties[index]
                                                    ['bedroom'],
                                                    'bathroom': allProperties[index]
                                                    ['bathroom'],
                                                    'mobile': allProperties[index]
                                                    ['mobile'],
                                                    'facing': allProperties[index]
                                                    ['facing'],
                                                    'availability':
                                                    allProperties[index]
                                                    ['availability'],
                                                    'furnishingDetails':
                                                    allProperties[index]
                                                    ['furnishingDetails'],
                                                    'imageUrl': allProperties[index]
                                                    ['imageUrl'],
                                                    'areaUnit': allProperties[index]
                                                    ['areaUnit'],
                                                    'addToFavourite':
                                                    toggleFavorite[
                                                    allProperties[index]
                                                    ['propertyId']],
                                                    'propertyId':
                                                    allProperties[index]
                                                    ['propertyId'],
                                                  });
                                                },
                                                icon: Icon(
                                                  toggleFavorite[
                                                  allProperties[index]
                                                  ['propertyId']] ==
                                                      true
                                                      ? Icons.favorite
                                                      : Icons
                                                      .favorite_outline_rounded,
                                                  color: toggleFavorite[
                                                  allProperties[index]
                                                  ['propertyId']] ==
                                                      true
                                                      ? Colors.pink.shade400
                                                      : Colors.black,
                                                )),
                                            Text('Save',
                                              style: TextStyle(
                                              fontSize: 12
                                            ),)
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize : MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.share_rounded)),
                                            Text('Share',
                                                style: TextStyle(
                                                fontSize: 12
                                            ))
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue
                                                .shade800, // Background color
                                            shadowColor:
                                            Colors.black, // Shadow color
                                            elevation: 5, // Elevation
                                            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  10), // Rounded corners
                                            ),
                                          ),
                                          onPressed: () async {
                                            final Uri call = Uri(
                                                scheme: 'tel',
                                                path:
                                                '+91${allProperties[index]['mobile']}');

                                            if (await canLaunchUrl(call)) {
                                              await launchUrl(call);
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return InkWell(
          onTap: () => _carouselController.animateToPage(entry.key),
          child: Container(
            width: 6.0, // Adjust size for better visibility
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (_currentIndex == entry.key ? Colors.white : Colors.grey)
                  .withOpacity(0.8), // Use more prominent color
            ),
          ),
        );
      }).toList(),
    );
  }
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