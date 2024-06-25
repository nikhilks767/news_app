import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsText {
  static final textMain = GoogleFonts.abrilFatface(
    fontSize: 30,
    color: Colors.purple[600],
  );
  static final textNews = GoogleFonts.rem(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
  static final sourceDateText =
      GoogleFonts.poppins(fontSize: 11, color: Colors.black.withOpacity(0.8));
  static final categoryText = GoogleFonts.rem(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
  static final searchText = GoogleFonts.poppins(
      fontSize: 14, color: Colors.purple, fontWeight: FontWeight.bold);
  static final newsDetailText = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.pink,
  );
}
