import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  final double textSize;
  const AboutUsPage({super.key, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INDY-5 Map Application',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Group Members: Harrison, Zach, Lucas, Eddie',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 4,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'The Map Application is a mobile app designed to help patients, families, and visitors navigate through the hospital using checkpoints. The inspiration for this project came from our lead documentation and algorithms engineer, Zach, whose mother works at the hospital. She noticed how confusing the layout of the new hospital additions could be, and Zach decided to find a solution.\n'
              'Zach brought the rest of the team together to develop this mobile application, aiming to improve the experience of navigating the hospital. Initially, the idea was to use QR-code checkpoints for patients once they checked in, with a simple database to verify information and authorization. This would allow users to receive an ID linked to a specific room, enabling navigation through the hospital using different methods, such as QR-codes, GPS, or a roadmap.\n'
              'However, due to the hospital\'s security and privacy policies, we had to adjust our plan. The current version of the Map Application is a beta that keeps the core idea intact, though all data is mocked for demonstration purposes. We are excited to present this version to you and continue our journey in developing a helpful tool for hospital visitors.',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
