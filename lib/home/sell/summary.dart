import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/home_container.dart';

class Summary extends StatefulWidget {
  final bool comingFromBuy;
  final String uid;
  final String propertyId;
  const Summary(
      {super.key,
        required this.comingFromBuy,
        required this.uid,
        required this.propertyId});
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool isLoading = false;
  Map<String, dynamic> propertyData = {};
  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];
  int _currentIndex = 0;
  bool? toggleFavorite;
  final CarouselController _carouselController = CarouselController();
  String _selectedCategory = 'Essential'; // To track the selected category
  final Map<String, List<Map<String, String>>> nearbyLandmarks = {
    'Essential': [
      {'Apollo hospital': '3.9km/3min'},
      {'Shree hospital': '2.6km/2min'},
    ],
    'Transit': [
      {'Bus Stop': '0.8km/5min'},
      {'Train Station': '4.5km/10min'},
    ],
    'Utility': [
      {'Supermarket': '1.2km/4min'},
      {'Gas Station': '3.2km/7min'},
    ],
    'Custom': [
      {'Park': '2.0km/5min'},
      {'Library': '1.5km/3min'},
    ],
  };

  @override
  void initState() {
    fetchPropertyData();
    super.initState();
  }

  void fetchPropertyData() async {
    setState(() {
      isLoading = true;
    });
    var propertyRef = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('property')
        .doc(widget.propertyId)
        .get();
    setState(() {
      propertyData = propertyRef.data()!;
      toggleFavorite = propertyRef.data()!['addToFavourite'];
      isLoading = false;
    });
  }

  void _onCategoryTap(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.blue.shade800,
          strokeWidth: 2,
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/slider');
                  },
                  child: CarouselSlider(
                    items:
                    propertyData['imageUrl'].map<Widget>((imageUrl) {
                      // List<dynamic> imageUrls =
                      //     propertyMap['imageUrl'] ?? [];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.24,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 300.0,
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
                ),
                Positioned(
                  bottom: 0, // Align at the bottom
                  left: 0,
                  right: 0,
                  child: Center(
                    child: _buildDotIndicator(),
                  ),
                ),
                Positioned(
                  top: 40,
                  // left: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: Icon(
                                  toggleFavorite == true
                                      ? Icons.favorite
                                      : Icons.favorite_outline_rounded,
                                  color: toggleFavorite == true
                                      ? Colors.pink.shade400
                                      : Colors.black,
                                  size: 20),
                              onPressed: () async {
                                setState(() {
                                  toggleFavorite = !toggleFavorite!;
                                });
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(widget.uid)
                                    .collection('property')
                                    .doc(widget.propertyId)
                                    .set({
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
                                  'availability':
                                  propertyData['availability'],
                                  'furnishingDetails':
                                  propertyData['furnishingDetails'],
                                  'imageUrl': propertyData['imageUrl'],
                                  'areaUnit': propertyData['areaUnit'],
                                  'addToFavourite': toggleFavorite,
                                  'propertyId':
                                  propertyData['propertyId'],
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green.shade800,
                              size: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "For Sale",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\u20b9 ${propertyData['value']}',
                        style: TextStyle(
                          fontFamily: GoogleFonts.kanit().fontFamily,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Property Details",
                        style: TextStyle(
                          fontFamily: GoogleFonts.kanit().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      RowValue(
                          iconData: Icons.area_chart_sharp,
                          title: 'Area',
                          value: propertyData['area']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.price_check_outlined,
                          title: 'Estimated Value',
                          value: '\u20b9 ${propertyData['value']}'),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.compass_calibration_rounded,
                          title: 'Facing',
                          value: propertyData['facing']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.timeline,
                          title: 'Year purchased',
                          value: propertyData['year']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.business,
                          title: 'Total Floors',
                          value: propertyData['floor']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.other_houses,
                          title: 'Property on floor',
                          value: propertyData['floor']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.bedroom_parent,
                          title: 'No. of bedrooms',
                          value: propertyData['bedroom']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.bathtub_rounded,
                          title: 'No. of bathrooms',
                          value: propertyData['bathroom']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.event_available,
                          title: 'Availability',
                          value: propertyData['availability']),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      RowValue(
                          iconData: Icons.table_restaurant_rounded,
                          title: 'Furnishing Details',
                          value: propertyData['furnishingDetails']),
                      SizedBox(height: 10),
                      Divider(),
                      widget.comingFromBuy
                          ? Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nearby Landmark",
                            style: TextStyle(
                              fontFamily:
                              GoogleFonts.kanit().fontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              _buildCategoryText('Essential'),
                              _buildCategoryText('Transit'),
                              _buildCategoryText('Utility'),
                              _buildCategoryText('Custom'),
                            ],
                          ),
                          SizedBox(height: 10),
                          ..._buildNearbyLandmarks(),
                          SizedBox(height: 15),
                        ],
                      )
                          : SizedBox(height: 0),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontFamily: GoogleFonts.kanit().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Don’t forget about our open house event happening today at {time},"
                            "{address). We can’t wait to show you around and answer any questions. "
                            "See you there",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      !widget.comingFromBuy
                          ? CustomButton(name: "Submit", onpressed: () {})
                          : SizedBox(
                        height: 0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
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
            width: 6.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (_currentIndex == entry.key ? Colors.white : Colors.grey)
                  .withOpacity(0.8),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String imageUrl) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCategoryText(String category) {
    return GestureDetector(
      onTap: () => _onCategoryTap(category),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          decoration: _selectedCategory == category
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    );
  }

  List<Widget> _buildNearbyLandmarks() {
    return nearbyLandmarks[_selectedCategory]!.map((landmark) {
      final name = landmark.keys.first;
      final distance = landmark.values.first;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name : ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                distance,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      );
    }).toList();
  }
}