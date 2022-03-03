import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simou/consts/colors.dart';
import 'package:simou/pages/Login/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.errorText,
    required this.controller,
  }) : super(key: key);

  final String? errorText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}
