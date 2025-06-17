import 'package:flutter/material.dart';

import 'homepage.dart';


class Technology {
  final String name;
  final IconData icon;
  final int proficiency;

  Technology(this.name, this.icon, this.proficiency);
}


class TechnologiesSection extends StatefulWidget {
  @override
  _TechnologiesSectionState createState() => _TechnologiesSectionState();
}

class _TechnologiesSectionState extends State<TechnologiesSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mobile Development
  final List<Technology> mobileTechnologies = [
    Technology('Flutter', Icons.flutter_dash, 90),
    Technology('Dart', Icons.code, 85),
    Technology('Android', Icons.android, 85),
    Technology('iOS', Icons.phone_iphone, 75),
    Technology('Java', Icons.coffee, 80),
  ];

  // Frontend Development
  final List<Technology> frontendTechnologies = [
    Technology('HTML', Icons.html, 80),
    Technology('CSS', Icons.css, 80),
    Technology('JavaScript', Icons.javascript, 75),
    Technology('Flutter Web', Icons.web, 85),
  ];

  // Backend Development
  final List<Technology> backendTechnologies = [
    Technology('Node.js', Icons.dns, 75),
    Technology('Firebase', Icons.local_fire_department, 80),
    Technology('Back4App', Icons.cloud, 70),
    Technology('AWS', Icons.cloud_queue, 70),
  ];

  // Database & Storage
  final List<Technology> databaseTechnologies = [
    Technology('MongoDB', Icons.storage, 70),
    Technology('Hive', Icons.folder, 80),
    Technology('Shared Preferences', Icons.settings, 85),
    Technology('Redis', Icons.memory, 65),
  ];

  // DevOps & Deployment
  final List<Technology> devopsTechnologies = [
    Technology('GitHub Actions', Icons.autorenew, 75),
    Technology('Render', Icons.cloud_upload, 70),
    Technology('Vercel', Icons.rocket_launch, 70),
    Technology('Netlify', Icons.public, 70),
  ];

  // Game Development
  final List<Technology> gameTechnologies = [
    Technology('Game Maker Studio 2', Icons.games, 75),
    Technology('2D Game Development', Icons.videogame_asset, 80),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Technologies & Skills',
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

          // Category Tabs
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF1A237E).withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              labelColor: Color(0xFF0A0E27),
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 11,
              ),
              isScrollable: true,
              tabs: [
                Tab(text: 'Mobile'),
                Tab(text: 'Frontend'),
                Tab(text: 'Backend'),
                Tab(text: 'Database'),
                Tab(text: 'DevOps'),
                Tab(text: 'Game Dev'),
              ],
            ),
          ),

          SizedBox(height: 40),

          // Tab Views
          Container(
            height: 480,
            child: TabBarView(
              controller: _tabController,
              children: [
                TechnologiesGrid(technologies: mobileTechnologies),
                TechnologiesGrid(technologies: frontendTechnologies),
                TechnologiesGrid(technologies: backendTechnologies),
                TechnologiesGrid(technologies: databaseTechnologies),
                TechnologiesGrid(technologies: devopsTechnologies),
                TechnologiesGrid(technologies: gameTechnologies),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TechnologiesGrid extends StatelessWidget {
  final List<Technology> technologies;

  const TechnologiesGrid({Key? key, required this.technologies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemCount: technologies.length,
      itemBuilder: (context, index) {
        return TechnologyCard(technology: technologies[index]);
      },
    );
  }
}

class TechnologyCard extends StatelessWidget {
  final Technology technology;

  const TechnologyCard({Key? key, required this.technology}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A237E).withOpacity(0.3),
            Color(0xFF16213E).withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            technology.icon,
            size: 40,
            color: Color(0xFF00FFFF),
          ),
          SizedBox(height: 15),
          Text(
            technology.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: technology.proficiency / 100,
            backgroundColor: Color(0xFF16213E),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00FFFF)),
          ),
          SizedBox(height: 5),
          Text(
            '${technology.proficiency}%',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF00FFFF),
            ),
          ),
        ],
      ),
    );
  }
}
