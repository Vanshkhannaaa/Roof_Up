import 'package:flutter/material.dart';
import 'package:roof_up/Common/appBar.dart';
import 'package:roof_up/Common/search_bar.dart';

import '../../Common/home_container.dart';

class ToLetPage extends StatefulWidget {
  const ToLetPage({super.key});

  @override
  State<ToLetPage> createState() => _ToLetPageState();
}

class _ToLetPageState extends State<ToLetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(name: 'To-Let', home: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomSearchBar(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeContainer(
                  iconColor: Colors.green.shade800,
                  onTap: () {
                    Navigator.of(context).pushNamed('/res');
                  },
                  name: 'residential',
                  iconData: Icons.maps_home_work_rounded,
                ),
                HomeContainer(
                  iconColor: Colors.orange.shade900,
                  onTap: () {
                    // Navigator.of(context).pushNamed('');
                  },
                  name: 'Commercial',
                  iconData: Icons.add_business_rounded,
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
