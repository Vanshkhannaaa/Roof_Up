import 'package:flutter/material.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellGuestRoom extends StatefulWidget {
  const SellGuestRoom({super.key});

  @override
  State<SellGuestRoom> createState() => _SellGuestRoomState();
}

class _SellGuestRoomState extends State<SellGuestRoom> {
  TextEditingController AreaController = TextEditingController();
  TextEditingController ValueController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  TextEditingController LoanController = TextEditingController();
  TextEditingController FloorController = TextEditingController();
  TextEditingController PropertyController = TextEditingController();
  TextEditingController BedroomController = TextEditingController();
  TextEditingController BathroomController = TextEditingController();
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
                    title: 'Estimated value (in \u20b9)',
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
                    hint: 'Built In ',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: LoanController,
                    title: 'Estimated Mortgage Balance',
                    hint: 'Enter Mortgage',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: FloorController,
                    title: 'Floor Details',
                    hint: 'Total Floors',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: PropertyController,
                    title: 'Property on floor (optional)',
                    hint: 'Enter year',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: BedroomController,
                    title: 'No. of bedrooms',
                    hint: 'Enter no. of bedrooms',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: BathroomController,
                    title: 'No. of bathrooms',
                    hint: 'Enter no. of bathrooms',
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
                    hint: 'Enter mobile no.',
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
