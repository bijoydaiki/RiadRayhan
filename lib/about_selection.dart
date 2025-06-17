import 'package:flutter/material.dart';

import 'homepage.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 40),
          Container(
            constraints: BoxConstraints(maxWidth: 900),
            child: Text(
              'I am a passionate Mobile App Developer with 3+ years of experience in mobile app development. I have 2+ years of expertise in Flutter development and 1 year of experience in native Android development using Java. I specialize in creating beautiful, functional, and user-friendly mobile applications that solve real-world problems.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),

          // Experience Highlights
          Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 15,
              children: [
                ExperienceChip(
                  icon: Icons.flutter_dash,
                  title: 'Flutter',
                  experience: '2+ Years',
                ),
                ExperienceChip(
                  icon: Icons.android,
                  title: 'Native Android',
                  experience: '1 Year',
                ),
                ExperienceChip(
                  icon: Icons.developer_mode,
                  title: 'Total Experience',
                  experience: '3+ Years',
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Platform Expertise
          Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                Text(
                  'Platform Expertise',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FFFF),
                  ),
                ),
                SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 10,
                  children: [
                    PlatformChip(
                      icon: Icons.android,
                      platform: 'Android',
                    ),
                    PlatformChip(
                      icon: Icons.phone_iphone,
                      platform: 'iOS',
                    ),
                    PlatformChip(
                      icon: Icons.desktop_windows,
                      platform: 'Windows',
                    ),
                    PlatformChip(
                      icon: Icons.web,
                      platform: 'Web',
                    ),
                    PlatformChip(
                      icon: Icons.psychology,
                      platform: 'Machine Learning',
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 40),

          // Location
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Color(0xFF00FFFF), size: 24),
              SizedBox(width: 10),
              Text(
                'Dhaka, Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF00FFFF),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class ExperienceChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String experience;

  const ExperienceChip({
    Key? key,
    required this.icon,
    required this.title,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A237E).withOpacity(0.4),
            Color(0xFF16213E).withOpacity(0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF00FFFF).withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Color(0xFF00FFFF),
            size: 30,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            experience,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF00FFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class PlatformChip extends StatelessWidget {
  final IconData icon;
  final String platform;

  const PlatformChip({
    Key? key,
    required this.icon,
    required this.platform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF00FFFF).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Color(0xFF00FFFF),
            size: 18,
          ),
          SizedBox(width: 8),
          Text(
            platform,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
