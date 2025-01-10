import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/main.dart'; // Ensure you have the correct import for secondaryColor

class ContactAmeerCard extends StatefulWidget {
  const ContactAmeerCard({super.key});

  @override
  _ContactAmeerCardState createState() => _ContactAmeerCardState();
}

class _ContactAmeerCardState extends State<ContactAmeerCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextStyle _labelStyle() {
    return GoogleFonts.poppins(
      fontSize: 15,
    );
  }

  TextStyle _inputTextStyle() {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 15,
    );
  }

  // Method to send email
  void _sendEmail() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mohdameer527@gmail.com', // Replace with the actual recipient email
      queryParameters: {
        'subject': 'Message from $name',
        'body': 'From: $name\nEmail: $email\nMessage: $message',
      },
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  // Validate Name
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Validate Email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Basic email validation regex
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final emailTest = RegExp(emailRegex);
    if (!emailTest.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate Message
  String? _validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a message';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Attach the global key here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Input
              _buildInputField("Name",
                  controller: _nameController, validator: _validateName),

              // Email Input
              _buildInputField("Email",
                  controller: _emailController, validator: _validateEmail),

              // Message Input
              _buildMessageField(
                  controller: _messageController, validator: _validateMessage),

              SizedBox(height: 40),

              // Send Message Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _sendEmail(); // If form is valid, send the email
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
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
                  child: const Text("Send Message"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label,
      {required TextEditingController controller,
      required String? Function(String?) validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: _labelStyle()),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          //decoration: _inputDecoration(),
          validator: validator,
          style: _inputTextStyle(),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildMessageField(
      {required TextEditingController controller,
      required String? Function(String?) validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Message", style: _labelStyle()),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: 4,
          //decoration: _inputDecoration(),
          validator: validator,
          style: _inputTextStyle(),
        ),
      ],
    );
  }
}
