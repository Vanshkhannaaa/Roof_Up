import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roof_up/Common/appBar.dart';
import 'package:photo_view/photo_view.dart';

class PhotoSlider extends StatelessWidget {

  PhotoSlider({super.key});

  final List<String> imgList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Photos',
        home: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 12,),
          Expanded(
            child: ListView.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(
                          imagePath: imgList[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:3.0,vertical: 2),
                    child: Image.asset(
                        imgList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  const FullScreenImage({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Center(
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained,
              enableRotation: false,
              imageProvider: AssetImage(imagePath),
              backgroundDecoration: BoxDecoration(
              color: Colors.white,
              ),
            ),
          ),
          SafeArea(
              child: IconButton(
                icon:Icon(Icons.close) ,
                onPressed: (){
                  Navigator.pop(context);
                },
              )
          )
        ],
      ),
    );
  }
}

