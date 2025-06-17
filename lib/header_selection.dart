import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homepage.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Animated background particles
          Positioned.fill(
            child: AnimatedParticles(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF00FFFF),
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF00FFFF).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'profile_photo.jpeg', // Add your photo here
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
                            ),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: Color(0xFF0A0E27),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Name
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
                  ).createShader(bounds),
                  child: Text(
                    'MD.RIAD RAYHAN',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Designation
                Text(
                  'Mobile App Developer',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF00FFFF),
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: 30),

                // Social Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: Icons.phone,
                      onTap: () => _launchURL('tel:01615573020'),
                    ),
                    SocialButton(
                      icon: Icons.email,
                      onTap: () => _launchURL('mailto:riadrayhan.cse@gmail.com'),
                    ),
                    SocialButton(
                      icon: Icons.language,
                      onTap: () => _launchURL('https:flutterhub.xyz'),
                    ),
                    SocialButton(
                      icon: Icons.business,
                      onTap: () => _launchURL('https://www.linkedin.com/in/flutterdeveloper100/'),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // CTA Button
                ElevatedButton(
                  onPressed: () {
                    // Scroll to projects section
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00FFFF),
                    foregroundColor: Color(0xFF0A0E27),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'View My Work',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}