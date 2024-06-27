import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/home_container.dart';
import 'package:roof_up/home/sell/sell_fields/sell_house.dart';

class Summary extends StatefulWidget {
  final bool comingFromBuy;
  final String uid;
  final String? propertyId;
  final Map<String, dynamic>? propertyData;
  const Summary({
    super.key,
    required this.comingFromBuy,
    required this.uid,
    this.propertyId,
    this.propertyData,
  });
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool isLoading = false;
  Map<String, dynamic> propertyData = {};
  int _currentIndex = 0;
  bool? toggleFavorite;
  List<String> imageUrls = [];
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
    // print(widget.propertyData!);
    widget.comingFromBuy ? fetchPropertyData() : super.initState();
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

  Future<void> addData() async {
    setState(() {
      isLoading = true;
    });
    String? id = FirebaseAuth.instance.currentUser?.uid;
    print(id);
    FirebaseStorage storageRef = FirebaseStorage.instance;
    List<File> imageFiles = List<File>.from(widget.propertyData!['imageData']);

    if (imageFiles.isNotEmpty) {
      await Future.forEach<File>(imageFiles, (File image) async {
        String fileName =
            'properties/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await storageRef.ref(fileName).putFile(image);
        String downloadURL = await storageRef.ref(fileName).getDownloadURL();
        setState(() {
          imageUrls.add(downloadURL);
        });
      });
    } else {
      imageUrls.add(
          'https://firebasestorage.googleapis.com/v0/b/propertyapp-c8111.appspot.com/o/properties%2F1.png?alt=media&token=9b04970b-1b2e-4cc3-a531-ed32ae54ed37');
    }

    print(imageUrls);

    var docRef = await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .collection('property')
        .add({
      'area': widget.propertyData!['area'],
      'value': widget.propertyData!['value'],
      'year': widget.propertyData!['year'],
      'loan': widget.propertyData!['loan'],
      'floor': widget.propertyData!['floor'],
      'bedroom': widget.propertyData!['bedroom'],
      'bathroom': widget.propertyData!['bathroom'],
      'mobile': widget.propertyData!['mobile'],
      'facing': widget.propertyData!['facing'],
      'availability': widget.propertyData!['availability'],
      'furnishingDetails': widget.propertyData!['furnishingDetails'],
      'imageUrl': imageUrls,
      'areaUnit': widget.propertyData!['areaUnit'],
      'addToFavourite': false,
      'propertyType': widget.propertyData!['propertyType'],
      'propertyDetails': widget.propertyData!['propertyDetails'],
      'sellType': widget.propertyData!['sellType'],
    });
    String idd = docRef.id;
    docRef.update({
      'propertyId': idd,
    });
    setState(() {
      isLoading = false;
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
          : Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/slider');
                        },
                        child: CarouselSlider(
                          items: (widget.propertyData == null
                              ? propertyData['imageUrl']
                              : widget.propertyData!['imageData'])
                              .map<Widget>((imageUrl) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height *
                                  0.24,
                              child: widget.propertyData == null
                                  ? Image.network(imageUrl,
                                  fit: BoxFit.cover)
                                  : Image.file(imageUrl,
                                  fit: BoxFit.cover),
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
                        )),
                    Positioned(
                      bottom: 5, // Align at the bottom
                      right: 5,
                      child: Center(
                        child: _buildNumericIndicator(),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      // left: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
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
                            widget.comingFromBuy
                                ? Padding(
                              padding:
                              const EdgeInsets.only(right: 12),
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
                                            : Icons
                                            .favorite_outline_rounded,
                                        color: toggleFavorite ==
                                            true
                                            ? Colors.pink.shade400
                                            : Colors.black,
                                        size: 20),
                                    onPressed: () async {
                                      setState(() {
                                        toggleFavorite =
                                        !toggleFavorite!;
                                      });
                                      var propertyRef =
                                      await FirebaseFirestore
                                          .instance
                                          .collectionGroup(
                                          'property')
                                          .where('propertyId',
                                          isEqualTo: widget
                                              .propertyId)
                                          .get();
                                      await propertyRef
                                          .docs.first.reference
                                          .set({
                                        'area': widget
                                            .propertyData!['area'],
                                        'value': widget
                                            .propertyData!['value'],
                                        'year': widget
                                            .propertyData!['year'],
                                        'loan': widget
                                            .propertyData!['loan'],
                                        'floor': widget
                                            .propertyData!['floor'],
                                        'bedroom':
                                        widget.propertyData![
                                        'bedroom'],
                                        'bathroom':
                                        widget.propertyData![
                                        'bathroom'],
                                        'mobile':
                                        widget.propertyData![
                                        'mobile'],
                                        'facing':
                                        widget.propertyData![
                                        'facing'],
                                        'availability':
                                        widget.propertyData![
                                        'availability'],
                                        'furnishingDetails': widget
                                            .propertyData![
                                        'furnishingDetails'],
                                        'imageUrl':
                                        widget.propertyData![
                                        'imageUrl'],
                                        'areaUnit':
                                        widget.propertyData![
                                        'areaUnit'],
                                        'addToFavourite':
                                        toggleFavorite,
                                        'propertyType':
                                        propertyData[
                                        'propertyType'],
                                        'propertyDetails':
                                        propertyData[
                                        'propertyDetails'],
                                        'saleType': propertyData[
                                        'saleType'],
                                        'propertyId':
                                        widget.propertyData![
                                        'propertyId'],
                                      });
                                    },
                                  )),
                            )
                                : SizedBox(
                              width: 0,
                              height: 0,
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
                            '\u20b9 ${widget.propertyData == null ? propertyData['value'] : widget.propertyData!['value']}',
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
                              value: widget.propertyData == null
                                  ? propertyData['area']
                                  : widget.propertyData!['area']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.price_check_outlined,
                              title: 'Estimated Value',
                              value:
                              '\u20b9 ${widget.propertyData == null ? propertyData['value'] : widget.propertyData!['value']}'),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.compass_calibration_rounded,
                              title: 'Facing',
                              value: widget.propertyData == null
                                  ? propertyData['facing']
                                  : widget.propertyData!['facing']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.timeline,
                              title: 'Year purchased',
                              value: widget.propertyData == null
                                  ? propertyData['year']
                                  : widget.propertyData!['year']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.business,
                              title: 'Total Floors',
                              value: widget.propertyData == null
                                  ? propertyData['floor']
                                  : widget.propertyData!['floor']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.bedroom_parent,
                              title: 'No. of bedrooms',
                              value: widget.propertyData == null
                                  ? propertyData['bedroom']
                                  : widget.propertyData!['bedroom']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.bathtub_rounded,
                              title: 'No. of bathrooms',
                              value: widget.propertyData == null
                                  ? propertyData['bathroom']
                                  : widget.propertyData!['bathroom']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.event_available,
                              title: 'Availability',
                              value: widget.propertyData == null
                                  ? propertyData['availability']
                                  : widget.propertyData!['availability']),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          RowValue(
                              iconData: Icons.table_restaurant_rounded,
                              title: 'Furnishing Details',
                              value: widget.propertyData == null
                                  ? propertyData['furnishingDetails']
                                  : widget.propertyData![
                              'furnishingDetails']),
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
                                  fontFamily: GoogleFonts.kanit()
                                      .fontFamily,
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
                          // Text(
                          //   widget.propertyData == null
                          //       ? propertyData['propertyDetails']
                          //       : widget.propertyData!['propertyDetails'],
                          //   style: TextStyle(fontSize: 16),
                          // ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          !widget.comingFromBuy
              ? Positioned(
            bottom: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width:
                      MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(
                                0xff1877F2), // Background color
                            shadowColor:
                            Colors.black, // Shadow color
                            elevation: 5, // Elevation
                            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Rounded corners
                            ),
                          ),
                          onPressed: () {
                            print(propertyData);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                builder: (context) => SellHouse(
                                  propertyData:
                                  widget.propertyData,
                                )));
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Container(
                      width:
                      MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(
                                0xff1877F2), // Background color
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
                            await addData();
                            Navigator.of(context)
                                .pushNamed('/confetti');
                            Future.delayed(Duration(seconds: 3),
                                    () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/sell');
                                });
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                )),
          )
              : SizedBox(
            height: 0,
          )
        ],
      ),
    );
  }

  Widget _buildNumericIndicator() {
    List<dynamic> imageUrls = widget.propertyData == null
        ? propertyData['imageUrl']
        : widget.propertyData!['imageData'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200.withOpacity(0.9),
      ),
      child: Text(
        '${_currentIndex + 1}/${imageUrls.length}',
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
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