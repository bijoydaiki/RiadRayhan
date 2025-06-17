import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homepage.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0A0E27),
            Color(0xFF16213E),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                icon: Icons.phone,
                onTap: () => _launchURL('tel:+1234567890'),
              ),
              SocialButton(
                icon: Icons.email,
                onTap: () => _launchURL('mailto:your.email@example.com'),
              ),
              SocialButton(
                icon: Icons.language,
                onTap: () => _launchURL('https://yourwebsite.com'),
              ),
              SocialButton(
                icon: Icons.business,
                onTap: () => _launchURL('https://linkedin.com/in/yourprofile'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '© 2024 Your Name. All rights reserved.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Made with ❤️ using Flutter',
            style: TextStyle(
              color: Color(0xFF00FFFF),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await   canLaunch(url)) {
      await launch(url);
    }
  }
}