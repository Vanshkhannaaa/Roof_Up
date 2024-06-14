import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Sell',home: false
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),

                AreaField(controller: AreaController),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: ValueController,
                    title: 'Estimated Value (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),

                SizedBox(height: 10),

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
                    title: 'Total Floors',
                    hint: 'Enter no. of floors',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: PropertyController,
                    title: 'Property on floor (optional)',
                    hint: 'Property on floor',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomDropdown(
                    options: [
                      'Ready to move',
                      'Under construction'
                    ],
                    title: 'Availability',
                    hint: 'Select Availability'),

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
      ),
    );
  }
}
