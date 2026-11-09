import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Supports/download_resume.dart';
import '../Supports/glass_container.dart';
import '../Supports/gradieent_button.dart';
import '../responsive/responsive.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsClick;

  const HeroSection({super.key, required this.onProjectsClick});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 40 : 80,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Ambient Glow Circle 1 (Cyan)
          Positioned(
            top: -40,
            right: isMobile ? -50 : 100,
            child: Container(
              width: isMobile ? 200 : 350,
              height: isMobile ? 200 : 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                const Color(0xFF38BDF8).withOpacity(isDark ? 0.15 : 0.25),
              ),
            ).animate().scale(
              duration: 2500.ms,
              curve: Curves.easeInOut,
            ),
          ),
          // Ambient Glow Circle 2 (Indigo)
          Positioned(
            bottom: -20,
            left: isMobile ? -40 : 50,
            child: Container(
              width: isMobile ? 180 : 300,
              height: isMobile ? 180 : 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                const Color(0xFF6366F1).withOpacity(isDark ? 0.15 : 0.2),
              ),
            ),
          ),

          // Main Hero Content
          Column(
            children: [
              if (isMobile)
                Column(
                  children: [
                    _buildAvatar(context, isMobile),
                    const SizedBox(height: 32),
                    _buildHeroText(context, isMobile, onProjectsClick),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildHeroText(context, isMobile, onProjectsClick),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: _buildAvatar(context, isMobile),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 60),

              // Quick Stats Counter Grid / Row
              _buildStatsSection(context, isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroText(
      BuildContext context, bool isMobile, VoidCallback onProjects) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      // FIX: CrossAlignment -> CrossAxisAlignment
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Availability Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isDark ? const Color(0x2610B981) : const Color(0x1A10B981),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF10B981).withOpacity(0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .scale(
                begin: const Offset(0.8, 0.8),
                end: const Offset(1.2, 1.2),
                duration: 1000.ms,
              ),
              const SizedBox(width: 8),
              const Flexible(
                child: Text(
                  "Available for Remote & On-Site Projects",
                  style: TextStyle(
                    color: Color(0xFF10B981),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0),

        const SizedBox(height: 20),

        // Greeting
        Text(
          "Hi, I'm Mohd Usama 👋",
          style: TextStyle(
            fontSize: isMobile ? 26 : 38,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

        const SizedBox(height: 12),

        // Dynamic Typing Effect Header
        // FIX: desktop height 70 -> 90 so a 2-line wrap doesn't overflow
        SizedBox(
          height: isMobile ? 80 : 90,
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 1500),
            animatedTexts: [
              TypewriterAnimatedText(
                "Senior Mobile App Developer",
                textStyle: TextStyle(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w800, // FIX: extrabold -> w800
                  color: const Color(0xFF38BDF8),
                  height: 1.2,
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
              TypewriterAnimatedText(
                "Flutter & Cross-Platform Specialist",
                textStyle: TextStyle(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF6366F1),
                  height: 1.2,
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
              TypewriterAnimatedText(
                "Logistics & Offline-First Engineer",
                textStyle: TextStyle(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFA855F7),
                  height: 1.2,
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Subtitle / Summary
        Text(
          "Architecting high-performance, enterprise-grade mobile and web applications with Flutter, Dart, clean state management, and robust offline synchronizations.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: isMobile ? 15 : 17,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

        const SizedBox(height: 32),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            GradientButton(
              onPressed: onProjects,
              text: "View Projects",
              icon: Icons.rocket_launch_rounded,
              height: 50,
            ),
            GradientButton(
              onPressed: downloadResume,
              text: "Download Resume",
              icon: Icons.download_rounded,
              isOutlined: true,
              height: 50,
            ),
          ],
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, bool isMobile) {
    final size = isMobile ? 240.0 : 320.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer Glowing Gradient Border Container
        Container(
          width: size + 16,
          height: size + 16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFF38BDF8),
                Color(0xFF6366F1),
                Color(0xFFA855F7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scale(
          begin: const Offset(0.98, 0.98),
          end: const Offset(1.02, 1.02),
          duration: 2500.ms,
        ),

        // Profile Image Container
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/me.png",
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),

        // Floating Experience Badge
        Positioned(
          bottom: 10,
          right: 10,
          child: GlassContainer(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            borderRadius: 24,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star_rounded,
                    color: Color(0xFFFFD166), size: 20),
                const SizedBox(width: 6),
                Text(
                  "4+ Yrs Exp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3, end: 0),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isMobile) {
    final stats = [
      {"count": "4+", "label": "Years Experience", "icon": Icons.timeline_rounded},
      {"count": "15+", "label": "Apps Delivered", "icon": Icons.phone_android_rounded},
      {"count": "15+", "label": "Enterprise Projects", "icon": Icons.business_center_rounded},
      {"count": "99.9%", "label": "Crash-Free Rate", "icon": Icons.verified_rounded},
    ];

    if (isMobile) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: stats.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final item = stats[index];
          return _statCard(
            context,
            item["count"] as String,
            item["label"] as String,
            item["icon"] as IconData,
          );
        },
      );
    }

    return Row(
      children: stats
          .map(
            (item) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _statCard(
              context,
              item["count"] as String,
              item["label"] as String,
              item["icon"] as IconData,
            ),
          ),
        ),
      )
          .toList(),
    );
  }

  Widget _statCard(
      BuildContext context, String count, String label, IconData icon) {
    return GlassContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF38BDF8),
            size: 26,
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800, // FIX: extrabold -> w800
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}