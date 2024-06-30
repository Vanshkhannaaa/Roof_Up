import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roof_up/Common/appBar.dart';
import 'package:photo_view/photo_view.dart';

class PhotoSlider extends StatelessWidget {
  final List<dynamic> images;
  final String imageType;

  PhotoSlider({super.key, required this.images, required this.imageType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Photos',
        home: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(
                          imageType: imageType,
                          imagePath: images[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3.0, vertical: 2),
                    child: imageType == 'url'
                        ? Image.network(images[index])
                        : Image.asset(
                            images[index],
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
  final String imageType;
  final String imagePath;
  const FullScreenImage(
      {super.key, required this.imagePath, required this.imageType});

  ImageProvider _getImageProvider() {
    if (imageType == 'url') {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained,
              enableRotation: false,
              imageProvider: _getImageProvider(),
              backgroundDecoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          SafeArea(
              child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
