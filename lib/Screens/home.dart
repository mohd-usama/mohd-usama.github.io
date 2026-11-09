import 'package:flutter/material.dart';

import '../Supports/custom_drawer.dart';
import '../Widgets/aboutme.dart';
import '../Widgets/contact.dart';
import '../Widgets/footer.dart';
import '../Widgets/hero.dart';
import '../Widgets/navbar.dart';
import '../Widgets/projects.dart';
import '../Widgets/skills.dart';
import '../Widgets/testimonials.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MobileDrawer(
        onAbout: () => scrollTo(aboutKey),
        onExperience: () => scrollTo(experienceKey),
        onSkills: () => scrollTo(skillsKey),
        onProjects: () => scrollTo(projectsKey),
        onContact: () => scrollTo(contactKey),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(
              onAbout: () => scrollTo(aboutKey),
              onExperience: () => scrollTo(experienceKey),
              onSkills: () => scrollTo(skillsKey),
              onProjects: () => scrollTo(projectsKey),
              onContact: () => scrollTo(contactKey),
              onOpenDrawer: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            HeroSection(
              onProjectsClick: () => scrollTo(projectsKey),
            ),
            Container(key: aboutKey, child: AboutMeSection(experienceKey: experienceKey)),
            Container(key: skillsKey, child: const SkillsSection()),
            Container(key: projectsKey, child: const ProjectsSection()),
            const TestimonialsSection(),
            Container(key: contactKey, child: const ContactSection()),
            FooterSection(
              onAbout: () => scrollTo(aboutKey),
              onExperience: () => scrollTo(experienceKey),
              onSkills: () => scrollTo(skillsKey),
              onProjects: () => scrollTo(projectsKey),
              onContact: () => scrollTo(contactKey),
            ),
          ],
        ),
      ),
    );
  }
}
