import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';
import 'package:svg_icon/svg_icon.dart';

class SkillsCard extends StatelessWidget {
  final String title;
  final List<String> skills; // Accepts a list of skills for scalability

  const SkillsCard({
    super.key,
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width < 1000 ? double.infinity : 400,
      child: Card(
        margin: const EdgeInsets.all(8),
        color: Theme.of(context).scaffoldBackgroundColor,
      
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 15),
              ...skills.map((skill) => _buildSkillRow(skill)).toList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillRow(String skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SvgIcon("images/check-circle-2-svgrepo-com.svg", color: primaryColor),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              skill,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color(0xFF787F8C),
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
