import 'package:flutter/material.dart';
import '../../../Common/property_slider.dart';
import '../../../Common/search_bar.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House/Flat',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20
        ),),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SmallSearchBar(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: PropertySlider(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: PropertySlider(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
