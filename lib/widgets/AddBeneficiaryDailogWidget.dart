import 'package:flutter/material.dart';
import 'package:top_up/models/beneficiary.dart';
import 'package:top_up/utils/alignments.dart';
import 'package:top_up/utils/appColors.dart';
import 'package:top_up/utils/textStyle.dart';
import 'package:top_up/widgets/appButtonWidget.dart';
import 'package:top_up/widgets/textFieldWidget.dart';

class AddBeneficiaryDialogWidget extends StatefulWidget {
  const AddBeneficiaryDialogWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddBeneficiaryDialogWidgetState createState() =>
      _AddBeneficiaryDialogWidgetState();
}

class _AddBeneficiaryDialogWidgetState
    extends State<AddBeneficiaryDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String nickname = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Beneficiary',
        style: appMainTextstyle(14, blueColor, FontWeight.w600),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              labelText: 'Nickname',
              isNumberField: false,
              onSaved: (value) => nickname = value!,
            ),
            height(16),
            AppTextField(
              labelText: 'Phone Number',
              isNumberField: true,
              onSaved: (value) => phoneNumber = value!,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: appMainTextstyle(14, blueColor, FontWeight.w600),
          ),
        ),
        AppButton(
          buttonText: 'Add',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.of(context).pop(
                  Beneficiary(nickname: nickname, phoneNumber: phoneNumber));
            }
          },
        )
      ],
    );
  }
}
