import 'package:flutter/services.dart';

class DoubleFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    int insertIndex = newValue.text.indexOf('.');
    String newText = newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    int selectionIndex = newText.length;

    if (insertIndex != -1) {
      newText = '${newText.substring(0, insertIndex)}.${newText.substring(insertIndex)}';
      selectionIndex++;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
