import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertySlider extends StatefulWidget {
  const PropertySlider({super.key});

  @override
  State<PropertySlider> createState() => _PropertySliderState();

}

class _PropertySliderState extends State<PropertySlider> {

  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  int _currentIndex = 0;

  bool _isFavorite = false;

  final CarouselController _carouselController = CarouselController();


  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/slider');
            },
            child: Stack(
              children: [
                CarouselSlider(
                  items: imgList.map((item) => _buildCarouselItem(context, item)).toList(),
                  options: CarouselOptions(
                      height: 170.0,
                      aspectRatio: 2,
                      viewportFraction: 0.8,
                      initialPage: 1,
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
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\u20b9 58,00,000',
                      style: TextStyle(
                        fontFamily: GoogleFonts.kanit().fontFamily,
                          fontWeight: FontWeight.w900,
                          fontSize: 24
                      ),),
                    Text('250 gaj (4BHK)',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      ),),
                    Text('Sec 32-A, Ldh',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              _toggleFavorite();
                            },
                            icon: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
                              color: _isFavorite ? Colors.pink.shade400 : Colors.black,
                            )),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.share_rounded))
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                          shadowColor: Colors.black, // Shadow color
                          elevation: 5, // Elevation
                          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: (){
                        },
                        child: Text('Call',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          )

        ],
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
