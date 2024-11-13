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
              'Our Team',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Harrison, Zach, Lucas, Eddie',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Our Mission',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              'The INDY-5 Map Application is designed to enhance the navigation experience for patients, families, and visitors within hospital facilities. Our goal is to make hospital visits less stressful by providing clear, intuitive directions using modern technology.',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              'Our Story',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              'The idea for this application originated from a real need identified by Zach, whose mother works at the hospital. She observed that navigating the expanding hospital layout was becoming increasingly difficult for visitors. Zach, along with Harrison, Lucas, and Eddie, decided to take on the challenge of creating a solution that would improve the hospital experience for everyone.',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              'Our Approach',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              'Initially, we envisioned a system using QR-code checkpoints to guide patients and visitors throughout the hospital. By scanning these checkpoints, users would receive personalized navigation instructions. However, due to privacy and security constraints, we adapted our approach to create a beta version that maintains the core idea while using mocked data for demonstration purposes.',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              'Looking Ahead',
              style: TextStyle(
                  fontFamily: 'Sans-serif',
                  fontSize: textSize + 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              'We are committed to continuing our work on the INDY-5 Map Application, striving to make hospital visits as seamless as possible. We believe that with innovation and teamwork, we can significantly improve the patient and visitor experience.',
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
