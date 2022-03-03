import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simou/consts/colors.dart';
import 'package:simou/pages/Login/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.errorText,
    required this.controller,
  }) : super(key: key);

  final String? hintText;
  final String? errorText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: validator,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}
