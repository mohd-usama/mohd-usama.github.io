import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Supports/download_resume.dart';
import '../Supports/gradieent_button.dart';
import '../responsive/responsive.dart';
import '../theme/theme_provider.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onAbout;
  final VoidCallback onExperience;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final VoidCallback? onOpenDrawer;

  const Navbar({
    super.key,
    required this.onAbout,
    required this.onExperience,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
    this.onOpenDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final isDark = theme.isDark;

    if (Responsive.isMobile(context)) {
      return ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: isDark ? const Color(0xCC0B0F19) : const Color(0xCCFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: onOpenDrawer,
                    ),
                    const SizedBox(width: 4),
                    _buildBrandLogo(context, isDark),
                  ],
                ),
                Row(
                  children: [
                    _buildThemeToggle(context, theme),
                    const SizedBox(width: 8),
                    GradientButton(
                      onPressed: downloadResume,
                      text: "Resume",
                      height: 38,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isTablet(context) ? 24 : 60,
          ),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xB30B0F19) : const Color(0xB3FFFFFF),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? const Color(0x1F38BDF8)
                    : const Color(0x1A000000),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBrandLogo(context, isDark),
              Row(
                children: [
                  _navLink("About", onAbout, context),
                  _navLink("Experience", onExperience, context),
                  _navLink("Skills", onSkills, context),
                  _navLink("Projects", onProjects, context),
                  _navLink("Contact", onContact, context),
                ],
              ),
              Row(
                children: [
                  _buildThemeToggle(context, theme),
                  const SizedBox(width: 16),
                  GradientButton(
                    onPressed: downloadResume,
                    text: "Resume",
                    icon: Icons.download_rounded,
                    height: 42,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandLogo(BuildContext context, bool isDark) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
      ).createShader(bounds),
      child: const Text(
        "<Usama.dev>",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context, ThemeProvider theme) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.isDark ? const Color(0x1A38BDF8) : const Color(0x0D000000),
        border: Border.all(
          color: theme.isDark ? const Color(0x3338BDF8) : const Color(0x1A000000),
        ),
      ),
      child: IconButton(
        onPressed: theme.toggleTheme,
        tooltip: theme.isDark ? "Switch to Light Mode" : "Switch to Dark Mode",
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
          child: Icon(
            theme.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            key: ValueKey(theme.isDark),
            color: theme.isDark ? const Color(0xFFFFD166) : const Color(0xFF6366F1),
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _navLink(String title, VoidCallback onTap, BuildContext context) {
    return _NavLinkWidget(title: title, onTap: onTap);
  }
}

class _NavLinkWidget extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLinkWidget({required this.title, required this.onTap});

  @override
  State<_NavLinkWidget> createState() => _NavLinkWidgetState();
}

class _NavLinkWidgetState extends State<_NavLinkWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                    color: _isHovered
                        ? (isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7))
                        : (isDark ? const Color(0xFFD1D5DB) : const Color(0xFF4B5563)),
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 2,
                  width: _isHovered ? 20 : 0,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
