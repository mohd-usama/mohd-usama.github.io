import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Supports/download_resume.dart';
import '../Supports/gradieent_button.dart';
import '../theme/theme_provider.dart';

class MobileDrawer extends StatelessWidget {
  final VoidCallback onAbout;
  final VoidCallback onExperience;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const MobileDrawer({
    super.key,
    required this.onAbout,
    required this.onExperience,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final isDark = theme.isDark;

    return Drawer(
      backgroundColor: isDark ? const Color(0xFF0B0F19) : const Color(0xFFF8FAFC),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
                    ).createShader(bounds),
                    child: const Text(
                      "<Usama.dev>",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _drawerItem(context, "About Me", Icons.person_outline_rounded, () {
                    Navigator.pop(context);
                    onAbout();
                  }),
                  _drawerItem(context, "Experience", Icons.work_outline_rounded, () {
                    Navigator.pop(context);
                    onExperience();
                  }),
                  _drawerItem(context, "Skills", Icons.code_rounded, () {
                    Navigator.pop(context);
                    onSkills();
                  }),
                  _drawerItem(context, "Projects", Icons.folder_copy_outlined, () {
                    Navigator.pop(context);
                    onProjects();
                  }),
                  _drawerItem(context, "Contact", Icons.mail_outline_rounded, () {
                    Navigator.pop(context);
                    onContact();
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: isDark ? const Color(0x1A38BDF8) : const Color(0x0D000000),
                    leading: Icon(
                      isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                      color: isDark ? const Color(0xFFFFD166) : const Color(0xFF6366F1),
                    ),
                    title: Text(
                      isDark ? "Light Mode" : "Dark Mode",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      theme.toggleTheme();
                    },
                  ),
                  const SizedBox(height: 16),
                  GradientButton(
                    onPressed: () {
                      Navigator.pop(context);
                      downloadResume();
                    },
                    text: "Download Resume",
                    icon: Icons.download_rounded,
                    width: double.infinity,
                    height: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 22),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      horizontalTitleGap: 12,
    );
  }
}
