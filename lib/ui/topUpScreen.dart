import 'package:flutter/material.dart';
import 'package:top_up/models/beneficiary.dart';
import 'package:top_up/models/user.dart';
import 'package:top_up/utils/alignments.dart';
import 'package:top_up/utils/appColors.dart';
import 'package:top_up/utils/constants.dart';
import 'package:top_up/utils/textStyle.dart';
import 'package:top_up/widgets/appButtonWidget.dart';
import 'package:top_up/widgets/snackBarWidget.dart';

class TopUpScreen extends StatefulWidget {
  final Beneficiary beneficiary;
  final User user;

  const TopUpScreen({super.key, required this.beneficiary, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  int? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: whiteColor
        ),
        backgroundColor: blueColor,
        title: Text(
          'Top Up',
          style: appMainTextstyle(20, ghostwhiteColor, FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top-up options:',
              style: appMainTextstyle(18, Colors.black, FontWeight.bold),
            ),
             height(8),
            Wrap(
              spacing: 8,
              children: topUpOptions.map((amount) {
                return ChoiceChip(
                  label: Text('AED $amount'),
                  selected: selectedAmount == amount,
                  onSelected: (selected) {
                    setState(() {
                      selectedAmount = selected ? amount : null;
                    });
                  },
                );
              }).toList(),
            ),
            height(16),
            Text(
              'Note: A charge of AED 1 will be applied for every top-up transaction.',
              style: appMainTextstyle(14, Colors.red, FontWeight.w500),
            ),
            height(16),
            
            AppButton(
              height: 40,
              width: 160,
              buttonText: 'Confirm Top-Up', onTap: _topUp)
          ],
        ),
      ),
    );
  }

  void _topUp() {
    if (selectedAmount == null) {
      showErrorSnackBar(context, 'Please select an amount to top up.');
      return;
    }

    double totalAmount = selectedAmount! + 1;

    if (totalAmount <= widget.user.balance) {
      double maxPerBeneficiary = widget.user.isVerified ? 1000 : 500;
      double maxTotal = 3000;

      double beneficiaryMonthlyTopUp =
          widget.beneficiary.monthlyTopUpAmount + selectedAmount!;
      double totalMonthlyTopUp =
          widget.user.totalMonthlyTopUp + selectedAmount!;

      if (beneficiaryMonthlyTopUp <= maxPerBeneficiary) {
        if (totalMonthlyTopUp <= maxTotal) {
          setState(() {
            widget.beneficiary.monthlyTopUpAmount = beneficiaryMonthlyTopUp;
            widget.user.totalMonthlyTopUp = totalMonthlyTopUp;
            widget.user.balance -= totalAmount;
          });
          Navigator.pop(context, true);
        } else {
          showErrorSnackBar(context, 'Exceeded total monthly top-up limit');
        }
      } else {
        showErrorSnackBar(
            context, 'Exceeded monthly top-up limit for this beneficiary');
      }
    } else {
      showErrorSnackBar(context, 'Insufficient balance');
    }
  }
}
