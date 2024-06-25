import 'package:flutter/material.dart';
import '../../../../Common/TextField.dart';
import '../../../../Common/appBar.dart';


class SellPlot extends StatefulWidget {
  const SellPlot({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Sell',home: false),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: RateController,
                    title: 'Rate ',
                    hint: 'Enter Rate',
                    type: TextInputType.number),

                SizedBox(height: 10,),

                AreaField(controller: AreaController),

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
                  controller: LoanController,
                    title: 'Estimated Mortgage',
                    hint: 'Enter mortgage',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                  controller: PurchaseController,
                    title: 'Year purchased',
                    hint: 'Enter year',
                    type: TextInputType.number),

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
      ),
    );
  }
}
