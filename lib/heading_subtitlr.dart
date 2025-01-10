import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/theme.dart';

class HeadingSubtitle extends StatefulWidget {
  final String heading;
  final String subtitle;
  const HeadingSubtitle({super.key, required this.heading, required this.subtitle});

  @override
  State<HeadingSubtitle> createState() => _HeadingSubtitleState();
}

class _HeadingSubtitleState extends State<HeadingSubtitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.heading,
          style:Theme.of(context).textTheme.displayLarge
        ),
        const SizedBox(height: 12),
        Text(
          widget.subtitle,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: const Color(0xFF787F8C),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}