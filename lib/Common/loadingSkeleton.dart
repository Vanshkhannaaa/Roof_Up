// import 'package:flutter/material.dart';

// class Loadingskeleton extends StatelessWidget {
//   const Loadingskeleton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade300,
//               blurRadius: 4.0,
//               spreadRadius: 3.0,
//             ),
//           ],
//           borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.24,
//           ),
          
//           Positioned(
//             bottom: 5,
//             left: 5,
//             child: Row(
//               children: [
//                 // allProperties[index].containsKey('furnishingDetails')
//                     ? Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blue.shade800.withOpacity(0.9),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           allProperties[index]['furnishingDetails'],
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.w700),
//                         ),
//                       )
//                     : SizedBox(
//                         width: 0,
//                         height: 0,
//                       ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 allProperties[index].containsKey('availability')
//                     ? Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blue.shade800.withOpacity(0.9),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           allProperties[index]['availability'],
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.w700),
//                         ),
//                       )
//                     : SizedBox(
//                         width: 0,
//                         height: 0,
//                       ),
//               ],
//             ),
//           ),
//           Positioned(
//             right: 5,
//             top: 5,
//             child: Center(
//               child: _buildNumericIndicator(
//                   allProperties[index]['imageUrl'],
//                   allProperties[index]['propertyId']),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.45,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '\u20b9 ${allProperties[index]['value']}',
//                         style: TextStyle(
//                             fontFamily: GoogleFonts.kanit().fontFamily,
//                             fontWeight: FontWeight.w900,
//                             fontSize: 24),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "Built in ${allProperties[index]['year']}, ${allProperties[index]['facing']} facing",
//                         softWrap: true,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13,
//                             color: Colors.grey),
//                       ),
//                       Text(
//                         '${allProperties[index]['area']} ${allProperties[index]['areaUnit']} ${allProperties[index].containsKey('bedroom') ? '(${allProperties[index]['bedroom']} BHK)' : ''}',
//                         style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.grey),
//                       ),
//                       Text(
//                         'Sec 32-A, Ldh',
//                         style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.grey),
//                       )
//                     ],
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Stack(
//                           // mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                                 padding: EdgeInsets.only(bottom: 8),
//                                 onPressed: () async {
//                                   setState(() {
//                                     // isLoading = true;
//                                     if (toggleFavorite[allProperties[index]
//                                             ['propertyId']] ==
//                                         true) {
//                                       toggleFavorite[allProperties[index]
//                                           ['propertyId']] = false;
//                                     } else {
//                                       toggleFavorite[allProperties[index]
//                                           ['propertyId']] = true;
//                                     }
//                                   });
//                                   var propertyRef = await FirebaseFirestore
//                                       .instance
//                                       .collectionGroup('property')
//                                       .where('propertyId',
//                                           isEqualTo: allProperties[index]
//                                               ['propertyId'])
//                                       .get();
//                                   propertyRef.docs.first.reference.update({
//                                     'addToFavourite': toggleFavorite[
//                                         allProperties[index]['propertyId']],
//                                   });
//                                 },
//                                 icon: Icon(
//                                   toggleFavorite[allProperties[index]
//                                               ['propertyId']] ==
//                                           true
//                                       ? Icons.favorite
//                                       : Icons.favorite_outline_rounded,
//                                   color: toggleFavorite[allProperties[index]
//                                               ['propertyId']] ==
//                                           true
//                                       ? Colors.pink.shade400
//                                       : Colors.black,
//                                 )),
//                             Positioned(
//                               bottom: -4,
//                               left: Checkbox.width * 0.5,
//                               child: Text(
//                                 'Save',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             )
//                           ],
//                         ),
//                         Stack(
//                           children: [
//                             IconButton(
//                                 padding: EdgeInsets.only(bottom: 8),
//                                 onPressed: () {},
//                                 icon: Icon(Icons.share_rounded)),
//                             Positioned(
//                               bottom: -4,
//                               left: Checkbox.width * 0.5,
//                               child:
//                                   Text('Share', style: TextStyle(fontSize: 12)),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: 100,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 Colors.blue.shade800, // Background color
//                             shadowColor: Colors.black, // Shadow color
//                             elevation: 5, // Elevation
//                             // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
//                             shape: RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.circular(10), // Rounded corners
//                             ),
//                           ),
//                           onPressed: () async {
//                             final Uri call = Uri(
//                                 scheme: 'tel',
//                                 path: '+91${allProperties[index]['mobile']}');

//                             if (await canLaunchUrl(call)) {
//                               await launchUrl(call);
//                             } else {
//                               throw 'Could not launch $call';
//                             }
//                           },
//                           child: Text(
//                             'Call',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           )),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
