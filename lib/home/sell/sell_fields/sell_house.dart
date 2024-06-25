import 'package:flutter/material.dart';
import 'package:roof_up/home/sell/add_details.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellHouse extends StatefulWidget {
  const SellHouse({super.key});

  @override
  State<SellHouse> createState() => _SellHouseState();
}

class _SellHouseState extends State<SellHouse> {
  TextEditingController AreaController = TextEditingController();
  TextEditingController ValueController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  TextEditingController LoanController = TextEditingController();
  TextEditingController FloorController = TextEditingController();
  TextEditingController PropertyController = TextEditingController();
  TextEditingController BedroomController = TextEditingController();
  TextEditingController BathroomController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  String facing = '';
  String areaUnit = '';
  String availability = '';
  String furnishingDetails = '';
  Map<String, dynamic> propertyData = {};

  void createDetails() {
    propertyData = {
      'area': AreaController.text.trim(),
      'value': ValueController.text.trim(),
      'year': YearController.text.trim(),
      'loan': LoanController.text.trim(),
      'floor': FloorController.text.trim(),
      'property': PropertyController.text.trim(),
      'bedroom': BedroomController.text.trim(),
      'bathroom': BathroomController.text.trim(),
      'mobile': MobileController.text.trim(),
      'facing': facing,
      'availability': availability,
      'furnishingDetails': furnishingDetails,
      'areaUnit': areaUnit,
    };
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddDetails(data: propertyData)));
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
                    ]),
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
                    title: 'Estimated Mortgage Balance',
                    hint: 'Enter Mortgage',
                    type: TextInputType.text),
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
                    controller: PropertyController,
                    title: 'Property on floor (optional)',
                    hint: 'Your floor',
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