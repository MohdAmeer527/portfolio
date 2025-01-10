import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';

class Introduction extends StatelessWidget {
  final bool isMobile;
  final bool isDarkMode;
  const Introduction(
      {super.key, required this.isMobile, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDarkMode
                ? [
                    Color(0xff1e2735),
                    Color(0xff131928),
                  ]
                : [
                    Color(0xffeff3ff),
                    Color(0xfffdfdff),
                  ],
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Flutter Developer',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 28 : 56,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Building Beautiful Mobile Apps',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 28 : 56,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Passionate about creating seamless cross-platform mobile experiences with Flutter.",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 16 : 20,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            Text(
              "Specialized in building beautiful, performant, and user-friendly applications.",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 16 : 20,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  textStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  elevation: 4,
                  shadowColor: primaryColor.withOpacity(0.4),
                  side: const BorderSide(color: primaryColor, width: 0),
                  splashFactory: InkSplash.splashFactory,
                ),
                child: const Text("View My Work ->")),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
