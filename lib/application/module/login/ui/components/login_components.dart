import 'package:flutter/material.dart';

/// Login Componentes
///

Widget customTextFormField({
  required Key key,
  required TextEditingController controller,
  required String initialValue,
  required int maxLines,
  required int maxLength,
  required Function(String? value) validator}) => TextFormField(
  key: key,
  controller: controller,
  maxLines: maxLines,
  maxLength: maxLength,
  decoration: InputDecoration(
    border: const UnderlineInputBorder(),
    labelText: initialValue,
  ),
  validator: (String? value) {
    if (value == null && value != '') {
      return validator('Cannot user this value');
    }
    else {
      return null;
    }
  },
);