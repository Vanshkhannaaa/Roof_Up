import 'package:flutter/material.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';
import '../../sell/add_details.dart';

class ResForm extends StatefulWidget {
  const ResForm({super.key});

  @override
  State<ResForm> createState() => _ResFormState();
}

class _ResFormState extends State<ResForm> {
  String areaUnit = '';
  String facing = '';
  String furnishingDetails = '';
  Map<String, dynamic> propertyData = {};

  TextEditingController AreaController = TextEditingController();
  TextEditingController ValueController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PropertyController = TextEditingController();
  TextEditingController BedroomController = TextEditingController();
  TextEditingController BathroomController = TextEditingController();
  TextEditingController MobileController = TextEditingController();

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
    } else if (AddressController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter Address"),
        duration: Duration(seconds: 3),
      ));
    } else if (PropertyController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter property on floor"),
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
    } else if (furnishingDetails == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select furnishing details"),
        duration: Duration(seconds: 3),
      ));
    } else {
      propertyData = {
        'area': AreaController.text.trim(),
        'value': ValueController.text.trim(),
        'address': AddressController.text.trim(),
        'property': PropertyController.text.trim(),
        'bedroom': BedroomController.text.trim(),
        'bathroom': BathroomController.text.trim(),
        'mobile': MobileController.text.trim(),
        'facing': facing,
        'furnishingDetails': furnishingDetails,
        'areaUnit': areaUnit,
        'propertyType': 'house',
      };
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddDetails(data: propertyData)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'To-Let', home: false),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AreaField(
                    title: 'Area',
                    hint: 'Enter Area',
                    initialValue: '',
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
                    title: 'Rent (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: AddressController,
                    title: 'Address',
                    hint: 'Enter Address',
                    type: TextInputType.text),
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
                    controller: PropertyController,
                    title: 'Property on floor',
                    hint: 'Enter property on floor',
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
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
