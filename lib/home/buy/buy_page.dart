import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      appBar: CustomAppBar(name: 'Buy',),
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
                            name: 'All Properties',
                            iconData: Icons.add_home_work,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Plot',
                            iconData: Icons.rectangle_outlined,
                            onTap: (){
                              Navigator.pushNamed(context, '/buyplot');
                            }
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'House',
                            iconData: Icons.house_rounded,
                            onTap: (){
                              Navigator.pushNamed(context, '/feed');
                            }
                        ),
                        HomeContainer(
                            name: 'Shop',
                            iconData: Icons.add_business_rounded,
                            onTap: (){}
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Flat',
                            iconData: Icons.business_rounded,
                            onTap: (){
                              Navigator.pushNamed(context, '/feed');
                            }
                        ),
                        HomeContainer(
                            name: 'Office',
                            iconData: Icons.business_center_rounded,
                            onTap: (){}
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Showroom',
                            iconData: Icons.storefront,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Factory',
                            iconData: Icons.factory,
                            onTap: (){}
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Commercial',
                            iconData: Icons.location_city,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Agriculture',
                            iconData: Icons.agriculture,
                            onTap: (){}
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Guest Room',
                            iconData: Icons.person,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Gym',
                            iconData: Icons.fitness_center_rounded,
                            onTap: (){}
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Weighbridge',
                            iconData: Icons.local_shipping,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Petrol Pump',
                            iconData: Icons.local_gas_station_rounded,
                            onTap: (){}
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'WareHouse',
                            iconData: Icons.warehouse_rounded,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Hotel',
                            iconData: Icons.hotel,
                            onTap: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Resort',
                            iconData: Icons.holiday_village_rounded,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Banquet Hall',
                            iconData: Icons.room_service_rounded,
                            onTap: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Restaurant',
                            iconData: Icons.fastfood_sharp,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Schools',
                            iconData: Icons.school_rounded,
                            onTap: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeContainer(
                            name: 'Hospital',
                            iconData: Icons.local_hospital_rounded,
                            onTap: (){}
                        ),
                        HomeContainer(
                            name: 'Theatre',
                            iconData: Icons.theaters_rounded,
                            onTap: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 30),

                        HomeContainer(
                            name: 'Others',
                            iconData: Icons.format_list_bulleted,
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
