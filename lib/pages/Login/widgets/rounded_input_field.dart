import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simou/consts/colors.dart';
import 'package:simou/pages/Login/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.validator,
    this.inputFormatters,
    required this.onChanged,
    required this.errorText,
  }) : super(key: key);

  final String? hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
