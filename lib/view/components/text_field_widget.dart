import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(String? val) validator;
  final Function(String? val)?  change;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget ? iconDelete;

  const TextFieldWidget({
    Key? key,
    required this.validator,
    required this.controller,
    required this.hintText,
   required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.iconDelete,
    this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (val) => validator(val),
        onChanged: (val) => change!(val),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffix: iconDelete,
          hintText: hintText,
          hintStyle: GoogleFonts.ptSans(
            color: Colors.grey,
          ),
          // alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
      )
        ),
      ),
    );
  }
}
