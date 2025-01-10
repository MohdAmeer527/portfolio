import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main.dart';
import 'package:url_launcher/url_launcher.dart';

class AppbarLinks extends StatelessWidget {
  final ScrollController scrollController ;
 
   const AppbarLinks({super.key, required this.scrollController});
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  // Logo
                  Text(
                    'Ameer.dev',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Navigation links
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Home',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {
                               scrollController.jumpTo(400);
                          },
                          child: Text(
                            'Projects',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {
                                    scrollController.jumpTo(1300);
                          },
                          child: Text(
                            'Skills',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {
                             scrollController.jumpTo(scrollController.position.maxScrollExtent);
                          },
                          child: Text(
                            'Contacts',
                           style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                         const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {
                             _launchURL('https://drive.google.com/file/d/1DX7-n2Vo83wCLOEWF8xvK6Q0nh8td_Zk/view?usp=drive_link'); // Replace with your Drive link
            
                 
                          },
                          child: Text(
                            'Resume',
                           style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
           
  }
}