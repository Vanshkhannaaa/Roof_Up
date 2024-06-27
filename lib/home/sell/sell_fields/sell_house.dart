import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roof_up/home/sell/add_details.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellHouse extends StatefulWidget {
  final Map<String, dynamic>? propertyData;
  const SellHouse({super.key, this.propertyData});

  @override
  State<SellHouse> createState() => _SellHouseState();
}

class _SellHouseState extends State<SellHouse> {
  late TextEditingController AreaController;
  late TextEditingController ValueController;
  late TextEditingController YearController;
  late TextEditingController LoanController;
  late TextEditingController FloorController;
  late TextEditingController BedroomController;
  late TextEditingController BathroomController;
  late TextEditingController MobileController;
  String facing = '';
  String areaUnit = '';
  String availability = '';
  String furnishingDetails = '';
  Map<String, dynamic> propertyData = {};

  @override
  void initState() {
    print(widget.propertyData);
    print(FirebaseAuth.instance.currentUser!.phoneNumber);
    AreaController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['area']);
    ValueController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['value']);
    YearController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['year']);
    LoanController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['loan']);
    FloorController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['floor']);
    BedroomController = TextEditingController(
        text:
        widget.propertyData == null ? '' : widget.propertyData!['bedroom']);
    BathroomController = TextEditingController(
        text: widget.propertyData == null
            ? ''
            : widget.propertyData!['bathroom']);
    MobileController = TextEditingController(
        text: widget.propertyData == null
            ? FirebaseAuth.instance.currentUser!.phoneNumber!.substring(3)
            : widget.propertyData!['mobile']);
    facing = widget.propertyData == null
        ? ''
        : (widget.propertyData!['facing'] ?? '');
    areaUnit = widget.propertyData == null
        ? ''
        : (widget.propertyData!['areaUnit'] ?? '');
    availability = widget.propertyData == null
        ? ''
        : (widget.propertyData!['availability'] ?? '');
    furnishingDetails = widget.propertyData == null
        ? ''
        : (widget.propertyData!['furnishingDetails'] ?? '');
    setState(() {});
    super.initState();
  }

  void createDetails() {
    if (AreaController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter Area"),
        duration: Duration(seconds: 3),
      ));
    } else if (ValueController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter value"),
        duration: Duration(seconds: 3),
      ));
    } else if (YearController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter year"),
        duration: Duration(seconds: 3),
      ));
    } else if (LoanController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter loan"),
        duration: Duration(seconds: 3),
      ));
    } else if (FloorController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter Floor"),
        duration: Duration(seconds: 3),
      ));
    } else if (BedroomController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter bedroom"),
        duration: Duration(seconds: 3),
      ));
    } else if (BathroomController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter bathroom"),
        duration: Duration(seconds: 3),
      ));
    } else if (MobileController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter mobile"),
        duration: Duration(seconds: 3),
      ));
    } else if (facing == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select facing"),
        duration: Duration(seconds: 3),
      ));
    } else if (areaUnit == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select area unit"),
        duration: Duration(seconds: 3),
      ));
    } else if (availability == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select availability"),
        duration: Duration(seconds: 3),
      ));
    } else if (furnishingDetails == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select furnishing details"),
        duration: Duration(seconds: 3),
      ));
    } else {
      propertyData = {
        'area': AreaController.text.trim(),
        'value': ValueController.text.trim(),
        'year': YearController.text.trim(),
        'loan': LoanController.text.trim(),
        'floor': FloorController.text.trim(),
        'bedroom': BedroomController.text.trim(),
        'bathroom': BathroomController.text.trim(),
        'mobile': MobileController.text.trim(),
        'facing': facing,
        'availability': availability,
        'furnishingDetails': furnishingDetails,
        'areaUnit': areaUnit,
        'propertyType': 'house',
        'sellType': 'sale',
      };
      if (widget.propertyData != null) {
        propertyData['imageData'] = widget.propertyData!['imageData'];
        propertyData['propertyDetails'] =
        widget.propertyData!['propertyDetails'];
      }

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddDetails(data: propertyData)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Sell', home: false),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AreaField(
                    initialValue: areaUnit,
                    onUnitSelected: (String? unit) {
                      setState(() {
                        areaUnit = unit ?? '';
                      });
                    },
                    controller: AreaController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: ValueController,
                    title: 'Estimated value (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  title: 'Facing',
                  hint: 'Select Facing',
                  initialValue: facing.isNotEmpty ? facing : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      facing = newValue ?? "";
                    });
                  },
                  options: [
                    'North',
                    'South',
                    'West',
                    'East',
                    'North-East',
                    'North-West',
                    'South-East',
                    'South-West',
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: YearController,
                    title: 'Year built',
                    hint: 'Built In ',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: LoanController,
                    title: 'Estimated Mortgage Balance (in \u20b9)',
                    hint: 'Enter Mortgage',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: FloorController,
                    title: 'Floor Details',
                    hint: 'Total Floors',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: BedroomController,
                    title: 'No. of bedrooms',
                    hint: 'Enter no. of bedrooms',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: BathroomController,
                    title: 'No. of bathrooms',
                    hint: 'Enter no. of bathrooms',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    initialValue: availability != '' ? availability : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        availability = newValue ?? "";
                      });
                    },
                    options: ['Ready to move', 'Under Construction'],
                    title: 'Availability',
                    hint: 'Select availability'),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    initialValue:
                    furnishingDetails != '' ? furnishingDetails : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        furnishingDetails = newValue ?? "";
                      });
                    },
                    options: [
                      'Fully furnished',
                      'Semi furnished',
                      'Unfurnished'
                    ],
                    title: 'Furnishing details',
                    hint: 'Select Details'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: MobileController,
                    title: 'Mobile No.',
                    hint: 'Enter mobile no.',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                    name: 'Next',
                    onpressed: () {
                      createDetails();
                    }),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}