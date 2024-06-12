import 'package:flutter/material.dart';
import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';

class SellShop extends StatefulWidget {
  const SellShop({super.key});

  @override
  State<SellShop> createState() => _SellShopState();
}

class _SellShopState extends State<SellShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Sell',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
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
                    title: 'Estimated Value (in \u20b9)',
                    hint: 'Enter value',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Facing',
                    hint: 'Facing ',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Year built',
                    hint: 'Built in',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Estimated mortgage balance',
                    hint: 'Enter mortgage',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Total Floors',
                    hint: 'Enter no. of floors',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Property on floor (optional)',
                    hint: 'Property on floor',
                    type: TextInputType.number),

                SizedBox(height: 10,),
                CustomTextField(
                    title: 'Availability',
                    hint: 'Availability',
                    type: TextInputType.text
                ),

                SizedBox(height: 10,),
                CustomTextField(
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
