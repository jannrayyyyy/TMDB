import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final List<Shadow>? shadow;
  final int? maxLine;
  final TextOverflow? overflow;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.alignment,
    this.shadow,
    this.maxLine,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        maxLines: maxLine,
        textAlign: alignment,
        style: GoogleFonts.quicksand(
            textStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color,
                shadows: shadow)));
  }
}
