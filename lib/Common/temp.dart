import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget _buildDotIndicator(List<String> imgList, CarouselController _carouselController, int _currentIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: imgList.asMap().entries.map((entry) {
      return InkWell(
        onTap: () => _carouselController.animateToPage(entry.key),
        child: Container(
          width: 6.0, // Adjust size for better visibility
          height: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (_currentIndex == entry.key
                ? Colors.white
                : Colors.grey).withOpacity(0.8), // Use more prominent color
          ),
        ),
      );
    }).toList(),
  );
}