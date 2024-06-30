import 'package:flutter/material.dart';
import 'package:roof_up/home/buy/feed/feed_page.dart';

import '../../../Common/home_container.dart';
import '../../../Common/search_bar.dart';

class PlotPage extends StatefulWidget {
  const PlotPage({super.key});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plot',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          name: 'Residential\nPlot',
                          iconData: Icons.home_rounded,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeedPage(
                                    propertyType: 'Residential Plot')));
                          }),
                      HomeContainer(
                          name: 'Commercial\nPlot',
                          iconData: Icons.location_city,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(propertyType: 'Commercial Plot')));
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                          name: 'Shop\nPlot',
                          iconData: Icons.add_business_rounded,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(propertyType: 'Shop Plot')));
                          }),
                      HomeContainer(
                          name: 'Factory\nPlot',
                          iconData: Icons.factory,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(propertyType: 'Factory Plot')));
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(width: 30),
                      HomeContainer(
                          name: 'Others',
                          iconData: Icons.format_list_bulleted_outlined,
                          onTap: () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
          CustomSearchBar()
        ],
      ),
    );
  }
}
