import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_wine/main.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Find product by name or code',
        hintStyle: GoogleFonts.ptSansCaption(fontSize: 12, color: Colors.grey),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
