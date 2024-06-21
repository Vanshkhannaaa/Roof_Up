import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContainer extends StatelessWidget {
  final String? name;
  IconData? iconData;
  final VoidCallback? onTap;

  HomeContainer({super.key, required this.name,required this.iconData,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width*.38,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
              color: Colors.grey.shade400.withOpacity(0.5),
              blurRadius: 4.0,
            ),],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade50
              ),
              child: Icon(
                iconData,
                color: Colors.blue.shade800,
                size: 40,
              ),
            ),//icon
            Center(
              child: Text('${name}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ) ,
      ),
    );
  }
}

class RowValue extends StatelessWidget {
  final String title;
  final String value;
  final IconData? iconData;
  const RowValue({super.key,required this.title,required this.value,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(iconData),
            SizedBox(width: 5),
            Text('${title} :',
              style: TextStyle(
                  fontFamily:GoogleFonts.kanit().fontFamily,
                  fontSize: 16
              ),
            ),
          ],
        ),
        Text(value,
          style: TextStyle(
              fontSize: 16
          ),
        )
      ],
    );
  }
}

