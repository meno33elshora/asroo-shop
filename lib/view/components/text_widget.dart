import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final bool notFontFamily;
  final TextDecoration? textDecoration;
  final Color ? decorationColor;
  final double? decorationThickness;
  final TextDecorationStyle? textDecorationStyle;
  final TextOverflow  textOverflow;
  final int ? maxLines ;


  const TextWidget({
    Key? key,
    required this.txt,
    required this.fontSize,
    required this.color,
    required this.notFontFamily,
    this.fontWeight,
    this.textDecoration,
    this.decorationColor,
    this.decorationThickness,
    this.textDecorationStyle,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.ptSans(
        fontSize: fontSize,
        color: color,
        fontWeight: notFontFamily ? fontWeight : null,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationStyle: textDecorationStyle,
        decorationThickness: decorationThickness,
      ),

    );
  }
}
