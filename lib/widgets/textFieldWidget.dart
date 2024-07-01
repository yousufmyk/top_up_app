import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final bool isNumberField;
  final void Function(String?) onSaved;
  final TextEditingController controller;

  AppTextField({
    required this.labelText,
    required this.isNumberField,
    required this.onSaved,
    super.key,
  }) : controller = TextEditingController() {
    if (isNumberField) {
      controller.text = "+971";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 0.6))),
      keyboardType: isNumberField ? TextInputType.phone : TextInputType.text,
      inputFormatters: isNumberField
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]*$')),
              LengthLimitingTextInputFormatter(13),
            ]
          : [
              LengthLimitingTextInputFormatter(20),
            ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        if (isNumberField && !value.startsWith('+971')) {
          return 'Number must start with +971';
        }
        if (isNumberField && value.length <= 4) {
          return 'Please enter a valid number';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }
}
