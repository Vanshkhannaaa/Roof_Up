import 'package:flutter/material.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellGuestRoom extends StatefulWidget {
  const SellGuestRoom({super.key});

  @override
  State<SellGuestRoom> createState() => _SellGuestRoomState();
}

class _SellGuestRoomState extends State<SellGuestRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Sell',
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                    title: 'Area',
                    hint: 'Enter Area',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Estimated value (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Facing',
                    hint: 'Facing ',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Year built',
                    hint: 'Built In ',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Estimated Mortgage Balance',
                    hint: 'Enter Mortgage',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Floor Details',
                    hint: 'Enter Floors',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Property on floor (optional)',
                    hint: 'Enter year',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'No. of bedrooms',
                    hint: 'Enter no. of bedrooms',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'No. of bathrooms',
                    hint: 'Enter no. of bathrooms',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Availability',
                    hint: 'Enter Availability',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Furnishing Details',
                    hint: 'Enter Furnishing details',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Quality Rating',
                    hint: 'Enter rating',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
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
