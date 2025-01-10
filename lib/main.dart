import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/appbarLinks.dart';
import 'package:portfolio/contact_ameer_card.dart';
import 'package:portfolio/contact_detail.dart';
import 'package:portfolio/drawer.dart';
import 'package:portfolio/heading_subtitlr.dart';
import 'package:portfolio/intro.dart';
import 'package:portfolio/project_card.dart';
import 'package:portfolio/skills.dart';
import 'package:portfolio/theme.dart';
import 'package:svg_icon/svg_icon.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

const Color primaryColor = Color(0xFF4F47E5); // Purple
const Color blackColor = Color(0xFF1E1E1E);
const Color whiteColor = Color(0xFFFFFFFF);

class _PortfolioAppState extends State<PortfolioApp> {
  // Track the theme mode
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mohd Ameer',
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: PortfolioScreen(
        isDarkMode: isDarkMode,
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode; // Toggle theme
          });
        },
      ),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const PortfolioScreen({
    required this.isDarkMode,
    required this.onThemeToggle,
    super.key,
  });

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      drawer: PortfolioDrawer(
        scrollController: _scrollController,
      ),
      appBar: AppBar(
        leading: LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.width < 800) {
              // Show hamburger menu on small screens
              return IconButton(
                icon: const Icon(Icons.menu, color: blackColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            } else {
              // For larger screens, return null to remove leading
              return Container(); // or return null;
            }
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.width >= 800) {
              // For larger screens
              return AppbarLinks(scrollController: _scrollController);
            }
            // For smaller screens, show only the logo
            return Text(
              'Ameer.dev',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 20,
              ),
            );
          },
        ),
        actions: [
          if (MediaQuery.of(context).size.width >= 800) ...[
            IconButton(
              icon: widget.isDarkMode
                  ? const SvgIcon('images/sun-svgrepo-com.svg', color: primaryColor)
                  : const SvgIcon('images/moon-svgrepo-com.svg', color: primaryColor),
              onPressed: widget.onThemeToggle,
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const SvgIcon('images/github-svgrepo-com.svg', color: primaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const SvgIcon('images/linkedin-svgrepo-com.svg', color: primaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const SvgIcon('images/mail-svgrepo-com.svg', color: primaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 16),
          ],
        ],
        centerTitle: false,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Introduction(isMobile: isMobile,isDarkMode:  widget.isDarkMode,)),
                    const SizedBox(height: 64),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: HeadingSubtitle(
                          heading: 'Featured Projects',
                          subtitle:
                              'Here are some of my recent Flutter projects that showcase my skills and expertise.'),
                    ),
                    const SizedBox(height: 64),
                    buildProjectCards(screenWidth, isMobile),
                    const SizedBox(height: 64),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0)),
                        child: Column(
                          children: [
                            const SizedBox(height: 64),
                            const HeadingSubtitle(
                                heading: 'Technical Skills',
                                subtitle:
                                    'My expertise in mobile development and related technologies.'),
                            Column(
                              children: [
                                const SizedBox(height: 32),
                                buildSkillsCards(screenWidth),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: HeadingSubtitle(
                          heading: 'Get in Touch',
                          subtitle:
                              "Interested in working together? Let's discuss your project."),
                    ),
                    const SizedBox(height: 64),
                    buildContactCards(screenWidth),
                    const SizedBox(height: 100),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget buildContactCards(double screenWidth) {
    return screenWidth < 1000
        ?  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
              children: [
                ContactAmeerCard(),
                SizedBox(height: 32),
                ContactDetail(),
              ],
            ),
        )
        :  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: SizedBox(height: 500, child: ContactAmeerCard())),
                SizedBox(width: 30),
                Flexible(
                    flex: 1,
                    child: SizedBox(height: 500, child: ContactDetail()))
              ],
            ),
        );
  }
  Widget buildProjectCards(double screenWidth, bool isMobile) {
    List<Map<String, dynamic>> projects = [
      {
        'title': 'Toucan Merchant App',
        'description':
            "The T Merchant App simplifies merchant operations with features like transaction tracking, offer creation, payment checkouts, and reports. It supports AI chatbot assistance, multi-language options, and themes, enhancing accessibility and efficiency in digital payments.",
        'link': "images/bank.jpeg",
        'skillsUsed': const ['flutter', 'dart', "git"],
      },
      {
        'title': 'Toucan V-CIP App',
        'description':
            "The Toucan V-CIP App provides real-time identity verification, document authentication, live interaction with agents, advanced facial recognition, liveness detection, and compliance with KYC/AML regulations. It ensures a seamless, user-friendly experience for customers and verification agents.",
        'link': "images/vcip.webp",
        'skillsUsed': const [
          'flutter',
          'dart',
          "git",
          'vscode',
          "Flutter",
          "Dart",
          "Firebase",
          "Figma"
        ],
      },
      {
        'title': 'School Management Teacher App.',
        'description':
            "The School Management Teacher App helps manage playschool administration, including student and parent details, notices, fee reminders, schedules, messaging, and attendance. It facilitates communication between teachers and parents, streamlining administrative tasks and improving engagement.",
        'link': "images/school.jpg",
        'skillsUsed': const ['flutter', 'dart', "git", 'figma'],
      }
    ];

    return screenWidth < 1000
        ? Column(
            children: projects.map((project) {
              return ProjectCard(
                title: project['title'],
                description: project['description'],
                isMobile: isMobile,
                link: project['link'],
                skillsUsed: project['skillsUsed'],
              );
            }).toList(),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: projects.map((project) {
                return ProjectCard(
                  title: project['title'],
                  description: project['description'],
                  isMobile: isMobile,
                  link: project['link'],
                  skillsUsed: project['skillsUsed'],
                );
              }).toList(),
            ),
          );
  }

  Widget buildSkillsCards(double screenWidth) {
    List<Map<String, dynamic>> skills = [
      {
        'title': "Flutter Development",
        'skills': [
          "Dart",
          "State Management",
          "App Architecture",
          "Reusable code",
          "Responsive Design",
          "Ui/UX Design"
        ]
      },
      {
        'title': "Backend Integration",
        'skills': [
          "Firebase",
          "WebSocket",
          "WebRTC",
          "RESTful APIs",
          "Push Notification",
          "Offline storage"
        ]
      },
      {
        'title': "Development Tools",
        'skills': [
          "Git & Version Control",
          "CI/CD Pipelines",
          "Testing & Debugging",
          "Performance Optimization",
          "Security Protocols",
          "Documentation"
        ]
      },
      {
        'title': "Soft Skills",
        'skills': [
          "Teamwork",
          "Problem Solving",
          "Communication",
          "Self-Initiation",
          "Practical Approach",
          "Issue Resolution"
        ]
      }
    ];

    return screenWidth < 1000
        ? Column(
            children: skills.map((skill) {
              return SkillsCard(
                title: skill['title'],
                skills: skill['skills'],
              );
            }).toList(),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: skills.map((skill) {
                return SkillsCard(
                  title: skill['title'],
                  skills: skill['skills'],
                );
              }).toList(),
            ),
          );
  }

  // Methods for building widgets remain unchanged
}
