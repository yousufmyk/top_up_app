import 'package:flutter/material.dart';
import 'package:top_up/ui/beneficiaryListView.dart';
import 'package:top_up/models/beneficiary.dart';

import 'package:top_up/utils/appColors.dart';
import 'package:top_up/utils/textStyle.dart';
import 'package:top_up/widgets/AddBeneficiaryDailogWidget.dart';
import 'package:top_up/widgets/snackBarWidget.dart';

class BeneficiaryScreen extends StatefulWidget {
  const BeneficiaryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BeneficiaryScreenState createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {
  final List<Beneficiary> beneficiaries = [];
  void _showAddBeneficiaryDialog() async {
    final result = await showDialog<Beneficiary>(
      context: context,
      builder: (BuildContext context) => const AddBeneficiaryDialogWidget(),
    );

    if (result != null) {
      setState(() {
        if (beneficiaries.length < 5) {
          beneficiaries.add(result);
        } else {
          showErrorSnackBar(context, 'Maximum number of beneficiaries reached');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: blueColor,
          child: const Icon(
            Icons.group_add_outlined,
            color: ghostwhiteColor,
          ),
          onPressed: () {
            _showAddBeneficiaryDialog();
          }),
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          'Beneficiaries',
          style: appMainTextstyle(20, ghostwhiteColor, FontWeight.w600),
        ),
      ),
      body: beneficiaries.isEmpty
          ? Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/No Beneficiary Yet Image.png'),
                      fit: BoxFit.fill)),
            )
          : Column(
              children: [
                BeneficiaryListView(beneficiaries: beneficiaries),
              ],
            ),
    );
  }
}
