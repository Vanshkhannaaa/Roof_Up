import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Common/TextField.dart';
import '../../Common/appBar.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: 'Calculator',home: false,),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  title: 'Total Amount',
                  hint: 'Enter Amount (in \u20b9)',
                  type: TextInputType.number,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmallTextField(
                      title: 'Area',
                      hint: 'Enter Area',
                      type: TextInputType.number
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                        child: Text('OR')),
                    SmallTextField(
                        title: 'Size',
                        hint: 'Enter Size',
                        type: TextInputType.number
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextField(
                  title: 'Rate ( in \u20b9 ) / yard',
                  hint: 'Rate/yard',
                  type: TextInputType.number,
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  title: 'Down Payment',
                  hint: 'Enter Amount (in \u20b9)',
                  type: TextInputType.number,
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  title: 'Installment Period (in years)',
                  hint: 'Enter period',
                  type: TextInputType.number,
                ),
                SizedBox(height: 10),
                CustomButton(name: "Submit",onpressed: (){})
              ],
            ),
          )
        ),
      ),
    );
  }
}
