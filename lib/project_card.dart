import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isMobile;
  final String link;
  final List<String> skillsUsed;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.skillsUsed,
    required this.isMobile,
    required this.link,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 1000 ? double.infinity : 400,
      child: Card(
        margin: const EdgeInsets.all(8),
       
      
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: AspectRatio(
                  aspectRatio: 4 / 3, // Maintain consistent image ratio
                  child: 
                      Image.asset(widget.link,  fit: BoxFit.cover,)
                     
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style:Theme.of(context).textTheme.headlineMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.description,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xFF787F8C),
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.skillsUsed
                        .map((skill) => _buildSkillRow(skill))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.share,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillRow(String skill) {
    return InputChip(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      label: Text(
        skill,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xff3630a3),
        ),
      ),
      backgroundColor: const Color(0xffe0e7ff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Color(0xffe0e7ff), width: 0),
      ),
      onPressed: () {},
    );
  }
}
