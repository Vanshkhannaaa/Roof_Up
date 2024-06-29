import 'package:flutter/material.dart';
import 'package:roof_up/home/sell/add_details.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellShop extends StatefulWidget {
  const SellShop({super.key});

  @override
  State<SellShop> createState() => _SellShopState();
}

class _SellShopState extends State<SellShop> {
  TextEditingController AreaController = TextEditingController();
  TextEditingController ValueController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  TextEditingController LoanController = TextEditingController();
  TextEditingController FloorController = TextEditingController();
  TextEditingController PropertyController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  String facing = '';
  String areaUnit = '';
  String availability = '';
  Map<String, dynamic> propertyData = {};

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
    } else {
      propertyData = {
        'area': AreaController.text.trim(),
        'value': ValueController.text.trim(),
        'year': YearController.text.trim(),
        'loan': LoanController.text.trim(),
        'floor': FloorController.text.trim(),
        'mobile': MobileController.text.trim(),
        'facing': facing,
        'availability': availability,
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
      appBar: CustomAppBar(name: 'Sell', home: false),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                AreaField(
                  title: 'Area',
                  hint: 'Enter Area',
                  controller: AreaController,
                  initialValue: '',
                  onUnitSelected: (String? unit) {
                    setState(() {
                      areaUnit = unit ?? '';
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: ValueController,
                    title: 'Estimated Value (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),
                SizedBox(height: 10),
                CustomDropdown(
                    title: 'Facing',
                    onChanged: (value) {
                      setState(() {
                        facing = value ?? '';
                      });
                    },
                    hint: 'Select Facing',
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
                SizedBox(height: 10),
                CustomTextField(
                    controller: YearController,
                    title: 'Year built',
                    hint: 'Built in',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: LoanController,
                    title: 'Estimated mortgage balance',
                    hint: 'Enter mortgage',
                    type: TextInputType.text),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: FloorController,
                    title: 'Total Floors',
                    hint: 'Enter no. of floors',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: PropertyController,
                    title: 'Property on floor (optional)',
                    hint: 'Property on floor',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    options: ['Ready to move', 'Under construction'],
                    onChanged: (value) {
                      setState(() {
                        availability = value ?? '';
                      });
                    },
                    title: 'Availability',
                    hint: 'Select Availability'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: MobileController,
                    title: 'Mobile No.',
                    hint: 'Enter Mobile No.',
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