import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';
import 'package:svg_icon/svg_icon.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
  
   
     
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildContactItem(
                const SvgIcon("images/phone-svgrepo-com.svg",
                    color: primaryColor),
                '+91 8919669753',
                "Phone"),
            _buildContactItem(
                const SvgIcon('images/mail-svgrepo-com.svg',
                    color: primaryColor),
                'mohdameer527@gmail.com',
                "Email"),
            _buildContactItem(
                const SvgIcon('images/location-pin-svgrepo-com.svg',
                    color: primaryColor),
                'Hyderabad, Telangana, India.',
                "Address"),
            _buildContactItem(
              const SvgIcon('images/linkedin-svgrepo-com.svg',
                  color: primaryColor),
              'linkedin.com/in/mohd-ameer-4067371a9',
              "Linkedin",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(Widget icon, String text, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  
                  ),
                ),
                SizedBox(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF787F8C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
