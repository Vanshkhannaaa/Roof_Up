import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../Common/TextField.dart';
import '../../../../Common/appBar.dart';
import '../../add_details.dart';

class SellPlot extends StatefulWidget {
  final Map<String, dynamic>? propertyData;
  const SellPlot({super.key, this.propertyData});

  @override
  State<SellPlot> createState() => _SellPlotState();
}

class _SellPlotState extends State<SellPlot> {
  TextEditingController AreaController = TextEditingController();
  TextEditingController RateController = TextEditingController();
  TextEditingController ValueController = TextEditingController();
  TextEditingController LoanController = TextEditingController();
  TextEditingController PurchaseController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  String facing = '';
  String areaUnit = 'Sq.yard';
  Map<String, dynamic> propertyData = {};

  @override
  void initState() {
    print(widget.propertyData);
    print(FirebaseAuth.instance.currentUser!.phoneNumber);
    RateController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['rate']);
    AreaController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['area']);
    ValueController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['value']);
    LoanController = TextEditingController(
        text: widget.propertyData == null ? '' : widget.propertyData!['loan']);
    PurchaseController = TextEditingController(
        text: widget.propertyData == null
            ? ''
            : widget.propertyData!['yearPurchased']);
    MobileController = TextEditingController(
        text: widget.propertyData == null
            ? FirebaseAuth.instance.currentUser!.phoneNumber!.substring(3)
            : widget.propertyData!['mobile']);
    facing = widget.propertyData == null
        ? ''
        : (widget.propertyData!['facing'] ?? '');
    areaUnit = widget.propertyData == null
        ? 'Sq.yard'
        : (widget.propertyData!['areaUnit'] ??
            'Sq.yard'); // Default to 'Sq.yard'
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
    } else if (RateController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter rate"),
        duration: Duration(seconds: 3),
      ));
    } else if (PurchaseController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter year purchased"),
        duration: Duration(seconds: 3),
      ));
    } else if (LoanController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter loan"),
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
    } else {
      propertyData = {
        'area': AreaController.text.trim(),
        'value': ValueController.text.trim(),
        'year': PurchaseController.text.trim(),
        'loan': LoanController.text.trim(),
        'rate': RateController.text.trim(),
        'mobile': MobileController.text.trim(),
        'facing': facing,
        'areaUnit': areaUnit,
        'propertyType': 'plot',
        'sellType': 'sale',
      };
      if (widget.propertyData != null) {
        propertyData['imageData'] = widget.propertyData!['imageData'];
        propertyData['propertyDetails'] =
            widget.propertyData!['propertyDetails'];
      }
      print(propertyData);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddDetails(data: propertyData)));
    }
  }

  void onUnitChanged(String unit) {
    setState(() {
      areaUnit = unit;
    });
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      AreaField(
                        controller: RateController,
                        initialValue: areaUnit,
                        title: 'Rate/Unit',
                        hint: 'Enter Rate/unit',
                        onUnitSelected: (String? unit) {
                          if (unit != null) {
                            onUnitChanged(unit);
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'OR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      AreaField(
                        title: 'Area',
                        hint: 'Enter Area',
                        initialValue: areaUnit,
                        onUnitSelected: (String? unit) {
                          if (unit != null) {
                            onUnitChanged(unit);
                          }
                        },
                        controller: AreaController,
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                          controller: ValueController,
                          title: 'Estimated Value (in \u20b9)',
                          hint: 'Enter value',
                          type: TextInputType.number),
                    ],
                  ),
                ),
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
                    controller: LoanController,
                    title: 'Estimated Loan Balance (in \u20b9)',
                    hint: 'Enter Loan Balance',
                    type: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: PurchaseController,
                    title: 'Year purchased',
                    hint: 'Enter year',
                    type: TextInputType.number),
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
