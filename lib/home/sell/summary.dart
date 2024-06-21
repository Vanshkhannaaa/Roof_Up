import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/home_container.dart';

class Summary extends StatefulWidget {
  final bool comingFromBuy;
  const Summary({super.key,required this.comingFromBuy});
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  int _currentIndex = 0;

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

  void _onCategoryTap(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/slider');
                  },
                  child: CarouselSlider(
                    items: imgList.map((item) =>
                        _buildCarouselItem(context, item)).toList(),
                    options: CarouselOptions(
                      aspectRatio: 14 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
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
                  top: 30,
                  left: 10,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.75),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 16),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
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
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green.shade800,
                              size: 12,
                            ),
                            SizedBox(width: 5,),
                            Text("For Sale",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\u20b9 50,00,000',
                        style: TextStyle(
                          fontFamily: GoogleFonts
                              .kanit()
                              .fontFamily,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),
                      Text("Property Details",
                        style: TextStyle(
                          fontFamily: GoogleFonts
                              .kanit()
                              .fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 20),
                      RowValue(
                        iconData: Icons.area_chart_sharp,
                          title: 'Area',
                          value: '250 sqft'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.price_check_outlined,
                          title: 'Estimated Value',
                          value: '\u20b9 50,00,000'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.compass_calibration_rounded,
                          title: 'Facing',
                          value: 'North'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.timeline,
                          title: 'Year purchased',
                          value: '2005'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.business,
                          title: 'Total Floors',
                          value: '2'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.other_houses,
                          title: 'Property on floor',
                          value: '2'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.bedroom_parent,
                          title: 'No. of bedrooms',
                          value: '5'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.bathtub_rounded,
                          title: 'No. of bathrooms',
                          value: '5'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.event_available,
                          title: 'Availability',
                          value: 'Immediately Available'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      SizedBox(height: 10),
                      RowValue(
                        iconData: Icons.table_restaurant_rounded,
                          title: 'Furnishing Details',
                          value: 'Fully furnished'
                      ),
                      SizedBox(height: 10),

                      Divider(),

                      widget.comingFromBuy?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Nearby Landmark",
                            style: TextStyle(
                              fontFamily: GoogleFonts
                                  .kanit()
                                  .fontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ):SizedBox(height: 0),

                      Divider(),

                      Text("Description",
                        style: TextStyle(

                          fontFamily: GoogleFonts
                              .kanit()
                              .fontFamily,
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

                      !widget.comingFromBuy?
                      CustomButton(
                          name: "Post",
                          onpressed: (){}
                      ):SizedBox(height: 0,)
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
      children: imgList
          .asMap()
          .entries
          .map((entry) {
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
      width: MediaQuery
          .of(context)
          .size
          .width,
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