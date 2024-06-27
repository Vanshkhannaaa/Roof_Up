import 'package:flutter/material.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellHalls extends StatefulWidget {
  const SellHalls({super.key});

  @override
  State<SellHalls> createState() => _SellHallsState();
}

class _SellHallsState extends State<SellHalls> {
  TextEditingController AreaController = TextEditingController();
  TextEditingController ValueController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  TextEditingController LoanController = TextEditingController();
  TextEditingController FloorController = TextEditingController();
  TextEditingController PropertyController = TextEditingController();
  TextEditingController MobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Sell',home: false
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AreaField(controller: AreaController,initialValue: '',),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: ValueController,
                    title: 'Estimated Value (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomDropdown(
                    title: 'Facing',
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

                SizedBox(height: 10,),

                CustomTextField(
                  controller: YearController,
                    title: 'Year built',
                    hint: 'Built in',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: LoanController,
                    title: 'Estimated mortgage balance',
                    hint: 'Enter mortgage',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: FloorController,
                    title: 'Floor Details',
                    hint: 'Enter Floor Details',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: PropertyController,
                    title: 'Property on floor (optional)',
                    hint: 'Property on floor',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomDropdown(
                    options:[
                      'Ready to move',
                      'Under Construction'
                    ],
                    title: 'Availability',
                    hint: 'Select availability'),

                SizedBox(height: 10,),

                CustomDropdown(
                    options:[
                      'Fully furnished',
                      'Semi furnished',
                      'Unfurnished'
                    ],
                    title: 'Furnishing details',
                    hint: 'Select Details'),


                SizedBox(height: 10,),

                CustomDropdown(
                    title: 'Quality Rating',
                    hint: 'Select Rating',
                    options: [
                      'No rating',
                      '1 star',
                      '2 star',
                      '3 star',
                      '4 star',
                      '5 star',
                      '6 star',
                      '7 star',
                    ]),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: MobileController,
                    title: 'Mobile No.',
                    hint: 'Enter Mobile No.',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomButton(name: 'Next',
                    onpressed: (){
                      Navigator.pushNamed(context, '/details');
                    }),

                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      )
    );
  }
}
