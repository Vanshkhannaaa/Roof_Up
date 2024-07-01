import 'package:flutter/material.dart';
import '../../Common/appBar.dart';
import '../../Common/home_container.dart';
import '../../Common/search_bar.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Sell',home:false),
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
                          iconColor: Colors.grey.shade800,
                          name: 'Plot',
                          iconData: Icons.rectangle_outlined,
                          onTap: (){
                            Navigator.pushNamed(context, '/spp');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.green.shade800,
                          name: 'House',
                          iconData: Icons.house_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellhouse');
                          }
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.orange.shade800,
                          name: 'Shop',
                          iconData: Icons.add_business_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.lightBlueAccent.shade400,
                          name: 'Flat',
                          iconData: Icons.business_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellflat');
                          }
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.brown.shade800,
                          name: 'Office',
                          iconData: Icons.business_center_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.deepPurple,
                          name: 'Showroom',
                          iconData: Icons.storefront,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.grey.shade500,
                          name: 'Factory',
                          iconData: Icons.factory,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.lightGreen,
                          name: 'Commercial Land',
                          iconData: Icons.location_city,
                          onTap: (){
                            Navigator.of(context).pushNamed('/sellplot');
                          }
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.red.shade800,
                          name: 'Agricultural Land',
                          iconData: Icons.agriculture,
                          onTap: (){}
                      ),
                      HomeContainer(
                          iconColor: Colors.blue.shade800,
                          name: 'Guest Room',
                          iconData: Icons.person,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.black,
                          name: 'Gym',
                          iconData: Icons.fitness_center_rounded,
                          onTap: (){}
                      ),
                      HomeContainer(
                          iconColor: Colors.grey.shade700,
                          name: 'Weighbridge\n( Dharam Kanta )',
                          iconData: Icons.local_shipping,
                          onTap: (){}
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.redAccent.shade700,
                          name: 'Petrol Pump',
                          iconData: Icons.local_gas_station_rounded,
                          onTap: (){}
                      ),
                      HomeContainer(
                          iconColor: Colors.brown.shade400,
                          name: 'Warehouse',
                          iconData: Icons.warehouse_rounded,
                          onTap: (){}
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.lime,
                          name: 'Hotel',
                          iconData: Icons.hotel,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.deepPurple,
                          name: 'Resort',
                          iconData: Icons.holiday_village_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.grey.shade400,
                          name: 'Banquet Hall',
                          iconData: Icons.room_service_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/sellhall');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.red.shade300,
                          name: 'Restaurant',
                          iconData: Icons.fastfood_sharp,
                          onTap: (){
                            Navigator.of(context).pushNamed('/sellhall');
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          iconColor: Colors.blue.shade800,
                          name: 'Schools',
                          iconData: Icons.school_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.red,
                          name: 'Hospital',
                          iconData: Icons.local_hospital_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(

                          name: 'Theature',
                          iconData: Icons.theaters_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/sellhall');
                          }
                      ),
                      HomeContainer(
                          iconColor: Colors.brown,
                          name: 'Others',
                          iconData: Icons.format_list_bulleted_rounded,
                          onTap: (){}
                      ),
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
              child:CustomSearchBar())
          ,
        ],
      ),
    );
  }
}