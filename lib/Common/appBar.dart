import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final bool home;
  const CustomAppBar({super.key, required this.name,required this.home});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !home,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.blue.shade100,
                blurRadius: 8.0,
                spreadRadius: 6.0),
          ],
          gradient: LinearGradient(
              colors: [Colors.white, Colors.blue.shade100],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          image: DecorationImage(
            opacity: 0.15,
            image: AssetImage(
              'assets/images/sky.png',
            ), // Your image asset here
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        '${name}',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: Colors.blue.shade800,
      centerTitle: true,
      surfaceTintColor: Colors.blue.shade800,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

