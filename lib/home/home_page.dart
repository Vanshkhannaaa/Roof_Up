import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Common/appBar.dart';
import '../Common/home_container.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> imgList = [
    'assets/images/mem1.jpg',
    'assets/images/mem2.jpg',
    'assets/images/mem3.jpg',
  ];

  int _currentIndex = 0;

  void initState(){
    print(FirebaseAuth.instance.currentUser);
    super.initState();
  }

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(name: 'Roof Up',home: true,),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CarouselSlider(
                          items: imgList.map((item) => _buildCarouselItem(context, item)).toList(),
                          options: CarouselOptions(
                            animateToClosest: true,
                            height: 150.0,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            initialPage: 0,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayCurve: Curves.linear,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          carouselController: _carouselController,
                        ),
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

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      iconColor: Colors.green.shade900,
                      onTap: () {
                        Navigator.of(context).pushNamed('/buy');
                      },
                      name: 'Buy',
                      iconData: Icons.add_home_work,
                    ),
                    HomeContainer(
                      iconColor: Colors.red.shade900,
                      onTap: () {
                        Navigator.of(context).pushNamed('/sell');
                      },
                      name: 'Sell',
                      iconData: Icons.home_work_sharp,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      iconColor: Colors.blue.shade900,
                      onTap: () {},
                      name: 'Rent',
                      iconData: Icons.add_home,
                    ),
                    HomeContainer(
                      iconColor: Colors.amber.shade900,
                      onTap: () {},
                      name: 'To-Let',
                      iconData: Icons.add_home_work_outlined,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      iconColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(context).pushNamed('/installment');
                      },
                      name: 'Installments',
                      iconData: Icons.calculate_rounded,
                    ),
                    HomeContainer(
                      iconColor: Colors.brown,
                      onTap: () {
                        Navigator.of(context).pushNamed('');
                      },
                      name: 'Listing',
                      iconData: Icons.list_alt_rounded,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeContainer(
                      iconColor: Colors.teal.shade900,
                      onTap: () {
                        Navigator.of(context).pushNamed('/installment');
                      },
                      name: 'Size Calculator',
                      iconData: Icons.area_chart_sharp,
                    ),
                    HomeContainer(
                      iconColor: Colors.deepPurple.shade900,
                      onTap: () {
                        Navigator.of(context).pushNamed('/animation');
                      },
                      name: 'My Listings',
                      iconData: Icons.list,
                    ),
                  ],
                ),
                SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String imageUrl) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.86, // Match the container width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover, // Ensures the image covers the container
            ),
          ),
        );
      },
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
