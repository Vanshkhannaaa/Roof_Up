import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roof_up/home/buy/feed/feed_page.dart';
import '../../Common/appBar.dart';
import '../../Common/home_container.dart';
import '../../Common/search_bar.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Buy', home: false),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.blue.shade800,
                          name: 'All Properties',
                          iconData: Icons.add_home_work,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(propertyType: 'All Properties')));
                          }),
                      HomeContainer(
                          iconColor: Colors.grey.shade800,
                          name: 'Plot',
                          iconData: Icons.rectangle_outlined,
                          onTap: () {
                            Navigator.pushNamed(context, '/buyplot');
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.green.shade800,
                          name: 'House',
                          iconData: Icons.house_rounded,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(propertyType: 'House')));
                          }),
                      HomeContainer(
                          iconColor: Colors.orange.shade800,
                          name: 'Shop',
                          iconData: Icons.add_business_rounded,
                          onTap: () {})
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.lightBlueAccent.shade400,
                          name: 'Flat',
                          iconData: Icons.business_rounded,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(propertyType: 'House')));
                          }),
                      HomeContainer(
                          iconColor: Colors.brown.shade800,
                          name: 'Office',
                          iconData: Icons.business_center_rounded,
                          onTap: () {})
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.deepPurple,
                          name: 'Showroom',
                          iconData: Icons.storefront,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.grey.shade500,
                          name: 'Factory',
                          iconData: Icons.factory,
                          onTap: () {})
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.lightGreen,
                          name: 'Commercial Land',
                          iconData: Icons.location_city,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.red.shade800,
                          name: 'Agricultural Land',
                          iconData: Icons.agriculture,
                          onTap: () {})
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.blue.shade800,
                          name: 'Guest Room',
                          iconData: Icons.person,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.black,
                          name: 'Gym',
                          iconData: Icons.fitness_center_rounded,
                          onTap: () {})
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.grey.shade700,
                          name: 'Weighbridge\n( Dharam Kanta )',
                          iconData: Icons.local_shipping,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.redAccent.shade700,
                          name: 'Petrol Pump',
                          iconData: Icons.local_gas_station_rounded,
                          onTap: () {})
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.brown.shade400,
                          name: 'WareHouse',
                          iconData: Icons.warehouse_rounded,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.lime,
                          name: 'Hotel',
                          iconData: Icons.hotel,
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.deepPurple,
                          name: 'Resort',
                          iconData: Icons.holiday_village_rounded,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.grey.shade400,
                          name: 'Banquet Hall',
                          iconData: Icons.room_service_rounded,
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.red.shade300,
                          name: 'Restaurant',
                          iconData: Icons.fastfood_sharp,
                          onTap: () {}),
                      HomeContainer(
                          iconColor: Colors.blue.shade800,
                          name: 'Schools',
                          iconData: Icons.school_rounded,
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.red,
                          name: 'Hospital',
                          iconData: Icons.local_hospital_rounded,
                          onTap: () {}),
                      HomeContainer(
                          name: 'Theatre',
                          iconData: Icons.theaters_rounded,
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 30),
                      HomeContainer(
                        iconColor: Colors.grey.shade700,
                          name: 'Others',
                          iconData: Icons.format_list_bulleted,
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              child: CustomSearchBar()),
        ],
      ),
    );
  }
}
