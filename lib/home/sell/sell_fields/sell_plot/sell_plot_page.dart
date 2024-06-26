import 'package:flutter/material.dart';
import 'package:roof_up/Common/appBar.dart';
import '../../../../Common/home_container.dart';
import '../../../../Common/search_bar.dart';

class SellPlotPage extends StatefulWidget {
  const SellPlotPage({super.key});

  @override
  State<SellPlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<SellPlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Plot',home: false),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                        iconColor: Colors.green.shade800,
                          name: 'residential\nPlot',
                          iconData: Icons.home_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellplot');
                          }),
                      HomeContainer(
                        iconColor: Colors.lightBlueAccent.shade400,
                          name: 'Commercial\nPlot',
                          iconData: Icons.location_city,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellplot');
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeContainer(
                        iconColor: Colors.orange.shade800,
                          name: 'Shop\nPlot',
                          iconData: Icons.add_business_rounded,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellplot');
                          }),
                      HomeContainer(
                        iconColor: Colors.grey.shade500,
                          name: 'Factory\nPlot',
                          iconData: Icons.factory,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellplot');
                          })
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 30),
                      HomeContainer(
                        iconColor: Colors.brown,
                          name: 'Others',
                          iconData: Icons.format_list_bulleted_outlined,
                          onTap: (){
                            Navigator.pushNamed(context, '/sellplot');
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              child:CustomSearchBar())
        ],
      ),
    );
  }
}
