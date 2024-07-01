import 'package:flutter/material.dart';
import 'package:top_up/models/beneficiary.dart';
import 'package:top_up/utils/alignments.dart';
import 'package:top_up/utils/appColors.dart';
import 'package:top_up/utils/textStyle.dart';
import 'package:top_up/widgets/appButtonWidget.dart';

class BeneficiaryCardWidget extends StatelessWidget {
  final Beneficiary beneficiary;
  final VoidCallback onTopUp;

  const BeneficiaryCardWidget({
    super.key,
    required this.beneficiary,
    required this.onTopUp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 200,
      margin: const EdgeInsets.all(8),
      child: Card(
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(beneficiary.nickname,
                  style: appMainTextstyle(20, blueColor, FontWeight.bold)),
              height(8),
              Text(beneficiary.phoneNumber),
              height(16),
              AppButton(
                height: 40,
                width: 80,
                buttonText: 'Top Up',
                onTap: onTopUp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
