import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade800.withOpacity(0.4),
                blurRadius: 3.0,
              ),],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.blue.shade800,width: 0.5)
        ),
        child: TextField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              hintText: 'Search locality, projects, landmarks..',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.blue.shade800),
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              )
          ),
        ),
      ),
    );
  }
}


class SmallSearchBar extends StatelessWidget {
  const SmallSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade800),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade800),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.62,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade800.withOpacity(0.4),
                    blurRadius: 3.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue.shade800, width: 0.5)),
            child: TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  hintText: 'Search locality, projects, landmarks..',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.blue.shade800),
                  contentPadding: EdgeInsets.all(-10),
                  hintStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.filter_list,
                color: Colors.blue.shade800,
              ),
              SizedBox(height: 5),
              Text('Filter',style: TextStyle(
                  fontSize: 12
              ),)
            ],
          )
        ],
      ),
    );
  }
}

