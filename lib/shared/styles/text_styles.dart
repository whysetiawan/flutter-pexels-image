import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get display2 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 22,
      );
  static TextStyle get title2 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );

  static TextStyle get title3 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );

  static TextStyle get title4 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );

  static TextStyle get body2 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );

  static TextStyle get body3 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static TextStyle get caption2 => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static TextStyle get btnPrimary => GoogleFonts.lato().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );
}
