import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Amiri extends StatelessWidget {
  final String text;
  final double fontS;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? letterSpacing;
  final TextDirection? textDirection;

  const Amiri({
    super.key,
    required this.text,
    required this.fontS,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.letterSpacing,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.amiri(
        fontSize: fontS,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
      textDirection: textDirection,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
