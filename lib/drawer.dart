import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:svg_icon/svg_icon.dart';
// Import url_launcher

class PortfolioDrawer extends StatefulWidget {
  final ScrollController scrollController;

  const PortfolioDrawer({
    super.key,
    required this.scrollController,
  });

  @override
  State<PortfolioDrawer> createState() => _PortfolioDrawerState();
}

class _PortfolioDrawerState extends State<PortfolioDrawer> {
  // Common method to style the text
  Text _buildDrawerText(String text, Color textColor, FontWeight fontWeight) {
    return Text(
      text,
       style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  // Common method for building ListTile
  ListTile _buildListTile(
    BuildContext context, {
  
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
     
      title: _buildDrawerText(title, blackColor, FontWeight.w500),
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
    );
  }

  // Method to launch URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
     
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Use a Container for the header to control height
          Container(
            height: 60, // Set the desired height here
            color:  Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ameer.dev',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  // Add some spacing between text and icon
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color:blackColor
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildListTile(
            context,
       
            title: 'Home',
            onTap: () {
              widget.scrollController.jumpTo(0); // Scroll to the top
            },
          ),
          _buildListTile(
            context,
          
            title: 'Projects',
            onTap: () {
              widget.scrollController.jumpTo(400); // Scroll to Projects section
            },
          ),
          _buildListTile(
            context,
          
            title: 'Skills',
            onTap: () {
              widget.scrollController.jumpTo(2400); // Scroll to Skills section
            },
          ),
       
          _buildListTile(
            context,
       
            title: 'Contacts',
            onTap: () {
            widget.scrollController.jumpTo(3900);
                           // Scroll to Contacts section
            },
          ),
             _buildListTile(
            context,
         
            title: 'Resume ',
            onTap: () {
              // Open the PDF from Google Drive link
              _launchURL('https://drive.google.com/file/d/1DX7-n2Vo83wCLOEWF8xvK6Q0nh8td_Zk/view?usp=drive_link'); // Replace with your Drive link
            },
          ),
        ],
      ),
    );
  }
}
