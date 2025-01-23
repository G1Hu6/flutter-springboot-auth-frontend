import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.icon,
    this.labelStyle,
    this.prefixIcon,
    this.bgColor,
    this.isHiddenPassword,
  });

  final String hintText;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved;
  bool? isHiddenPassword;
  Widget? icon;
  Color? bgColor;
  TextStyle? labelStyle;
  Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: validator,
      onSaved: onSaved,
      obscureText: (isHiddenPassword == null) ? false : isHiddenPassword!,
      decoration: InputDecoration(
        filled: true,
        fillColor: (bgColor == null)
            ? Theme.of(context).colorScheme.surfaceContainer
            : bgColor,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(27, 30, 40, 1),
        ),
        suffixIcon: icon,
      ),
    );
  }
}
