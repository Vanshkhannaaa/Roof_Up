import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContainer extends StatelessWidget {
  final String? name;
  IconData? iconData;
  final VoidCallback? onTap;
  final Color? iconColor;

  HomeContainer({super.key, required this.name,required this.iconData,required this.onTap,this.iconColor});

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
            Icon(
              iconData,
              color: iconColor,
              size: 50,
            ),//icon
            Center(
              child: Text('${name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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


class ProfileRow extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final String value;


  const ProfileRow({super.key,required this.name,required this.iconData,required this.value,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                  iconData,
                  color: Colors.grey.shade800,
                  size: 20),
              SizedBox(width: 10),
              Text(name,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(value,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey.shade700,)
            ],
          )
        ],
      ),
    );
  }
}


