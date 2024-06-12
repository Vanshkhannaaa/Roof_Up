import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType type;
  const CustomTextField({super.key,required this.title, required this.hint,required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: TextField(
            keyboardType: type,
            cursorColor: Colors.blue.shade800,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade700)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800)
                )
            ),
          ),
        )
      ],
    );
  }
}

class SmallTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType type;
  const SmallTextField({super.key,required this.title, required this.hint,required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.37,
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 5),
          TextField(
            keyboardType: type,
            cursorColor: Colors.blue.shade800,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade700)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800)
                )
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onpressed;
  const CustomButton({super.key,required this.name, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(

            backgroundColor: Color(0xff1877F2), // Background color
            shadowColor: Colors.black, // Shadow color
            elevation: 5, // Elevation
            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
          ),
          onPressed: onpressed,
          child: Text(name,
            style: TextStyle(
              color: Colors.white,
            ),
          )
      ),
    );
  }
}


