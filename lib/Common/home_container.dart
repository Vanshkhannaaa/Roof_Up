import 'package:flutter/material.dart';

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
