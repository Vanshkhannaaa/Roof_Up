import 'package:flutter/material.dart';
import '../../Common/appBar.dart';
import '../../Common/home_container.dart';


class InstallmentPage extends StatefulWidget {
  const InstallmentPage({super.key});

  @override
  State<InstallmentPage> createState() => _InstallmentPageState();
}

class _InstallmentPageState extends State<InstallmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(name: 'Installments',),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeContainer(
                    name: 'Calculator',
                    iconData: Icons.calculate_rounded,
                    onTap: (){
                      Navigator.pushNamed(context, '/calculator');
                    }),
                  HomeContainer(
                    name: 'Report',
                    iconData: Icons.checklist_rtl_rounded,
                    onTap: (){})
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeContainer(
                    name: 'Receipt',
                    iconData: Icons.receipt_long_rounded,
                    onTap: (){}),
                  HomeContainer(
                    name: 'Statement',
                    iconData: Icons.newspaper_rounded,
                    onTap: (){})
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 30),
                  HomeContainer(
                    name: 'Overdue',
                    iconData: Icons.access_time_filled_rounded,
                    onTap: (){}),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
