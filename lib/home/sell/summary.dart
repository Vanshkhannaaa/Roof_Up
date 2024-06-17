import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/Common/TextField.dart';
import 'package:roof_up/Common/appBar.dart';
import 'package:roof_up/Common/home_container.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Summary', home: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Stack(
                children: [
                  CarouselSlider(
                    items: imgList.map((item) => _buildCarouselItem(context, item)).toList(),
                    options: CarouselOptions(
                      height: 170.0,
                      aspectRatio: 2,
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
                          size: 20,
                        ),
                        SizedBox(width: 5,),
                        Text("For Sale",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\u20b9 50,00,000',
                    style: TextStyle(
                      fontFamily: GoogleFonts.kanit().fontFamily,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),

                  RowValue(
                      title: 'Area',
                      value: '250 sqft'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Estimated Value',
                      value: '\u20b9 50,00,000'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Facing',
                      value: 'North'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Year purchased',
                      value: '2005'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Total Floors',
                      value: '2'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Property on floor',
                      value: '2'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'No. of bedrooms',
                      value: '5'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'No. of bathrooms',
                      value: '5'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Availability',
                      value: 'Immediately Available'
                  ),

                  SizedBox(height: 5),

                  RowValue(
                      title: 'Furnishing Details',
                      value: 'Fully furnished'
                  ),

                  SizedBox(height: 5),

                  Divider(),

                  SizedBox(height: 10),

                  Text("Nearby Landmark",
                    style: TextStyle(
                      fontFamily: GoogleFonts.kanit().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Essential',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,decoration:TextDecoration.underline,decorationStyle: TextDecorationStyle.solid),),
                      Text('Transit',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                      Text('Utility',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                      Text('Custom',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                    ],
                  ),

                  SizedBox(height:10),
                  Text('Hospital',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: GoogleFonts.kanit().fontFamily),),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Apollo hospital : ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('3.9km/3min',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shree hospital : ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('2.6km/2min',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('Education',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: GoogleFonts.kanit().fontFamily),),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BCM School : ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('0.5km/1min',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Manipal University : ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('5.4km/6min',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: 15),

                  Text('Description',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: GoogleFonts.kanit().fontFamily),),
                  Divider(),

                  Text("Don’t forget about our open house event happening today at {time},"
                      "{address). We can’t wait to show you around and answer any questions. "
                      "See you there",style: TextStyle(fontSize: 16),),

                  SizedBox(height: 10,),

                  CustomButton(name: 'Post', onpressed: (){}),
                ],
              )
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
              color: (_currentIndex == entry.key
                  ? Colors.white
                  : Colors.grey).withOpacity(0.8), // Use more prominent color
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
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
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

