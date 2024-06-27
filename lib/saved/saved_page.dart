import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/common.dart';
import 'package:roof_up/Common/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Common/globals.dart' as globals;
import '../home/sell/summary.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  Map<String, bool> toggleFavorite = {};

  Stream<QuerySnapshot> getSavedProperties() {
    return FirebaseFirestore.instance
        .collectionGroup('property')
        .where('addToFavourite', isEqualTo: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder<QuerySnapshot>(
        stream: getSavedProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CommonClass.loader(context);
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No property found"),
            );
          }

          var allProperties = snapshot.data!.docs;

          return SingleChildScrollView(
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
                    var property =
                    allProperties[index].data() as Map<String, dynamic>;

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(
                              comingFromBuy: true,
                              uid: globals.uid,
                              propertyId: property['propertyId'],
                            ),
                          ),
                        );
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CarouselSlider(
                                  items: property['imageUrl']
                                      .map<Widget>((imageUrl) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.24,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
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
                                  bottom: 5,
                                  left: 5,
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200
                                              .withOpacity(0.9),
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          property['furnishingDetails'],
                                          style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200
                                              .withOpacity(0.9),
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          property['availability'],
                                          style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  top:5,
                                  child: Center(
                                    child:
                                    _buildNumericIndicator(
                                        property['imageUrl']),
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
                                        '\u20b9 ${property['value']}',
                                        style: TextStyle(
                                          fontFamily:
                                          GoogleFonts.kanit().fontFamily,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        '${property['area']} ${property['areaUnit']} (${property['bedroom']}BHK)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Sec 32-A, Ldh',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              IconButton(
                                                padding:
                                                EdgeInsets.only(bottom: 8),
                                                onPressed: () async {
                                                  var propertyRef =
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collectionGroup(
                                                      'property')
                                                      .where('propertyId',
                                                      isEqualTo: property[
                                                      'propertyId'])
                                                      .get();

                                                  await propertyRef
                                                      .docs.first.reference
                                                      .update({
                                                    'addToFavourite': !property[
                                                    'addToFavourite'],
                                                  });
                                                },
                                                icon: Icon(
                                                  property['addToFavourite'] ==
                                                      true
                                                      ? Icons.favorite
                                                      : Icons
                                                      .favorite_outline_rounded,
                                                  color: property[
                                                  'addToFavourite'] ==
                                                      true
                                                      ? Colors.pink.shade400
                                                      : Colors.black,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: -4,
                                                left: Checkbox.width * 0.5,
                                                child: Text(
                                                  'Save',
                                                  style:
                                                  TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              IconButton(
                                                padding:
                                                EdgeInsets.only(bottom: 8),
                                                onPressed: () {},
                                                icon: Icon(Icons.share_rounded),
                                              ),
                                              Positioned(
                                                bottom: -4,
                                                left: Checkbox.width * 0.5,
                                                child: Text('Share',
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            Colors.blue.shade800,
                                            shadowColor: Colors.black,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () async {
                                            final Uri call = Uri(
                                              scheme: 'tel',
                                              path: '+91${property['mobile']}',
                                            );

                                            if (await canLaunchUrl(call)) {
                                              await launchUrl(call);
                                            } else {
                                              throw 'Could not launch $call';
                                            }
                                          },
                                          child: Text(
                                            'Call',
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNumericIndicator(List<dynamic> imageList) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200.withOpacity(0.9)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_currentIndex + 1}/${imageList.length}',
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