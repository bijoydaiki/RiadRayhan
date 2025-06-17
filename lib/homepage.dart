import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/project_model.dart';
import 'package:portfolio/project_selection.dart';
import 'package:portfolio/technologies_selection.dart';
import 'about_selection.dart';
import 'footer_section.dart';
import 'header_selection.dart';

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0A0E27),
        fontFamily: 'Roboto',
      ),
      home: PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF16213E),
              Color(0xFF1A237E),
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeaderSection(),
                AboutSection(),
                ProjectsSection(),
                TechnologiesSection(),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: Color(0xFF00FFFF),
        child: Icon(Icons.keyboard_arrow_up, color: Color(0xFF0A0E27)),
      ),
    );
  }
}



class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF00FFFF), width: 2),
            gradient: LinearGradient(
              colors: [
                Color(0xFF00FFFF).withOpacity(0.1),
                Color(0xFF0099FF).withOpacity(0.1),
              ],
            ),
          ),
          child: Icon(
            icon,
            color: Color(0xFF00FFFF),
            size: 24,
          ),
        ),
      ),
    );
  }
}




class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A237E).withOpacity(0.3),
            Color(0xFF16213E).withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Icon(
                project.icon,
                size: 50,
                color: Color(0xFF0A0E27),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  project.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: project.technologies
                      .map((tech) => TechChip(tech: tech))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TechChip extends StatelessWidget {
  final String tech;

  const TechChip({Key? key, required this.tech}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFF00FFFF).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        tech,
        style: TextStyle(
          fontSize: 10,
          color: Color(0xFF00FFFF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}







class AnimatedParticles extends StatefulWidget {
  @override
  _AnimatedParticlesState createState() => _AnimatedParticlesState();
}

class _AnimatedParticlesState extends State<AnimatedParticles>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlesPainter(_controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class ParticlesPainter extends CustomPainter {
  final double animationValue;

  ParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF00FFFF).withOpacity(0.1)
      ..strokeWidth = 1;

    for (int i = 0; i < 50; i++) {
      final x = (size.width * (i * 0.1 + animationValue)) % size.width;
      final y = (size.height * (i * 0.05 + animationValue * 0.5)) % size.height;
      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

