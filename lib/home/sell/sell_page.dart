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
                          name: 'Plot',
                          iconData: Icons.rectangle_outlined,
                          onTap: (){
                            Navigator.pushNamed(context, '/spp');
                          }
                      ),
                      HomeContainer(
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
                          name: 'Shop',
                          iconData: Icons.add_business_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      ),
                      HomeContainer(
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
                          name: 'Office',
                          iconData: Icons.business_center_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      ),
                      HomeContainer(
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
                          name: 'Factory',
                          iconData: Icons.factory,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellshop');
                          }
                      ),
                      HomeContainer(
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
                          name: 'Agricultural Land',
                          iconData: Icons.agriculture,
                          onTap: (){}
                      ),
                      HomeContainer(
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
                          name: 'Gym',
                          iconData: Icons.fitness_center_rounded,
                          onTap: (){}
                      ),
                      HomeContainer(
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
                          name: 'Petrol Pump',
                          iconData: Icons.local_gas_station_rounded,
                          onTap: (){}
                      ),
                      HomeContainer(
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
                          name: 'Hotel',
                          iconData: Icons.hotel,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      ),
                      HomeContainer(
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
                          name: 'Banquet Hall',
                          iconData: Icons.room_service_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/sellhall');
                          }
                      ),
                      HomeContainer(
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
                          name: 'Schools',
                          iconData: Icons.school_rounded,
                          onTap: (){
                            Navigator.of(context).pushNamed('/guestroom');
                          }
                      ),
                      HomeContainer(
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
