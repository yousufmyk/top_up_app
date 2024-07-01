import 'package:flutter/material.dart';

import 'package:top_up/models/beneficiary.dart';
import 'package:top_up/models/user.dart';
import 'package:top_up/ui/topUpScreen.dart';
import 'package:top_up/widgets/beneficiaryCardWidget.dart';
import 'package:top_up/widgets/snackBarWidget.dart';

class BeneficiaryListView extends StatefulWidget {
  final List<Beneficiary> beneficiaries;

  const BeneficiaryListView({super.key, required this.beneficiaries});

  @override
  State<BeneficiaryListView> createState() => _BeneficiaryListViewState();
}

class _BeneficiaryListViewState extends State<BeneficiaryListView> {
  void _navigateToTopUp(BuildContext context, Beneficiary beneficiary) async {
    final user = User(balance: 3000, isVerified: false);

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TopUpScreen(beneficiary: beneficiary, user: user),
      ),
    );

    if (result == true) {
      setState(() {
        showSuccessSnackBar(context, 'Top Up Successfully');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.beneficiaries.length,
        itemBuilder: (context, index) {
          return BeneficiaryCardWidget(
            beneficiary: widget.beneficiaries[index],
            onTopUp: () =>
                _navigateToTopUp(context, widget.beneficiaries[index]),
          );
        },
      ),
    );
  }
}
