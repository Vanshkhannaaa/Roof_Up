import 'package:flutter/material.dart';

import '../../../Common/TextField.dart';
import '../../../Common/appBar.dart';


class SellPlot extends StatefulWidget {
  const SellPlot({super.key});

  @override
  State<SellPlot> createState() => _SellPlotState();
}

class _SellPlotState extends State<SellPlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Sell'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                    title: 'Rate ',
                    hint: 'Enter Rate',
                    type: TextInputType.number),

                SizedBox(height: 10,),

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
                    title: 'Estimated Mortgage',
                    hint: 'Enter mortgage',
                    type: TextInputType.text),

                SizedBox(height: 10,),

                CustomTextField(
                    title: 'Year purchased',
                    hint: 'Enter year',
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
      ),
    );
  }
}
