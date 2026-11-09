import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Supports/glass_container.dart';
import '../responsive/responsive.dart';

class AboutMeSection extends StatefulWidget {
  final GlobalKey? experienceKey;

  const AboutMeSection({super.key, this.experienceKey});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  bool _showCodeView = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : (isTablet ? 36 : 70),
        vertical: isMobile ? 28 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title Header
          _sectionHeader(
            context,
            "About Me & Career Journey",
            "Transforming complex business logic into intuitive, high-performance mobile experiences",
          ),

          SizedBox(height: isMobile ? 22 : 32),

          // About Summary & Interactive Visual Card
          if (isMobile)
            Column(
              children: [
                _buildAboutVisual(context, isMobile),
                const SizedBox(height: 24),
                _buildAboutDescription(context, isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildAboutVisual(context, isMobile),
                ),
                const SizedBox(width: 36),
                Expanded(
                  flex: 6,
                  child: _buildAboutDescription(context, isMobile),
                ),
              ],
            ),

          SizedBox(height: isMobile ? 32 : 46),

          // Work History / Experience Timeline
          Container(
            key: widget.experienceKey,
            child: _buildExperienceTimeline(context, isMobile),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title, String subtitle) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Eyebrow badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF38BDF8).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF38BDF8).withValues(alpha: 0.3),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_pin_rounded, size: 15, color: Color(0xFF38BDF8)),
              SizedBox(width: 6),
              Text(
                "WHO I AM & WHAT I DO",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                  color: Color(0xFF38BDF8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Main Gradient Title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF38BDF8), Color(0xFF6366F1), Color(0xFFA855F7)],
          ).createShader(bounds),
          child: Text(
            title,
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 24 : 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 6),

        // Subtitle
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),

        // Gradient Indicator Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: const LinearGradient(
                  colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 6,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFFA855F7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutVisual(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassContainer(
      padding: const EdgeInsets.all(14),
      borderRadius: 20,
      borderColor: const Color(0xFF38BDF8).withValues(alpha: 0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header bar with Mode Switcher (Visual vs Code)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // macOS style window dots
              Row(
                children: [
                  _windowDot(const Color(0xFFFF5F56)),
                  const SizedBox(width: 5),
                  _windowDot(const Color(0xFFFFBD2E)),
                  const SizedBox(width: 5),
                  _windowDot(const Color(0xFF27C93F)),
                  const SizedBox(width: 10),
                  Text(
                    _showCodeView ? "MohdUsama.dart" : "Developer Showcase",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : const Color(0xFF475569),
                    ),
                  ),
                ],
              ),

              // Interactive Toggle Switch
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F172A) : const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
                  ),
                ),
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _toggleButton(
                      title: "Visual",
                      icon: Icons.palette_outlined,
                      isActive: !_showCodeView,
                      onTap: () => setState(() => _showCodeView = false),
                    ),
                    _toggleButton(
                      title: "Code",
                      icon: Icons.code_rounded,
                      isActive: _showCodeView,
                      onTap: () => setState(() => _showCodeView = true),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Main Visual Area
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: _showCodeView ? _buildCodeMockup(context, isMobile) : _buildVisualIllustration(context, isMobile),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.08, end: 0);
  }

  Widget _windowDot(Color color) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _toggleButton({
    required String title,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isActive
              ? const LinearGradient(
                  colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
                )
              : null,
          color: isActive ? null : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 12,
              color: isActive ? Colors.white : const Color(0xFF64748B),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualIllustration(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final containerHeight = isMobile ? 280.0 : 350.0;

    return Container(
      key: const ValueKey("visual_illustration"),
      height: containerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  const Color(0xFF0F172A),
                  const Color(0xFF1E1B4B),
                  const Color(0xFF0B0F19),
                ]
              : [
                  const Color(0xFFF1F5F9),
                  const Color(0xFFE0E7FF),
                  const Color(0xFFF8FAFC),
                ],
        ),
        border: Border.all(
          color: const Color(0xFF38BDF8).withValues(alpha: 0.2),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Background ambient radiant glowing circles
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF38BDF8).withValues(alpha: isDark ? 0.2 : 0.22),
              ),
            ),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                begin: const Offset(0.85, 0.85),
                end: const Offset(1.15, 1.15),
                duration: 3500.ms,
              ),

          Positioned(
            bottom: 20,
            right: 15,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withValues(alpha: isDark ? 0.2 : 0.22),
              ),
            ),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                begin: const Offset(1.15, 1.15),
                end: const Offset(0.85, 0.85),
                duration: 4000.ms,
              ),

          // Central Illustration with soft gradient fade mask at bottom
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.65, 0.85, 1.0],
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/about_me.png",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),

          // Floating Badge: 4+ Years Experience (Top Left)
          Positioned(
            top: 12,
            left: 12,
            child: _floatingBadge(
              icon: Icons.auto_awesome_rounded,
              color: const Color(0xFFFFB703),
              label: "4+ Yrs Experience",
              sublabel: "Mobile & Web",
            ).animate(onPlay: (c) => c.repeat(reverse: true)).slideY(
                  begin: 0,
                  end: -0.06,
                  duration: 2600.ms,
                ),
          ),

          // Floating Badge: Flutter & Firebase (Top Right)
          Positioned(
            top: 12,
            right: 12,
            child: _floatingBadge(
              icon: Icons.flutter_dash_rounded,
              color: const Color(0xFF38BDF8),
              label: "Flutter & Firebase",
              sublabel: "Clean Architecture",
            ).animate(onPlay: (c) => c.repeat(reverse: true)).slideY(
                  begin: -0.06,
                  end: 0,
                  duration: 2800.ms,
                ),
          ),

          // Floating Badge: State Management (Bottom Left)
          Positioned(
            bottom: 12,
            left: 12,
            child: _floatingBadge(
              icon: Icons.account_tree_rounded,
              color: const Color(0xFF10B981),
              label: "BLoC • Riverpod",
              sublabel: "GetX • Provider",
            ).animate(onPlay: (c) => c.repeat(reverse: true)).slideY(
                  begin: 0,
                  end: 0.06,
                  duration: 3000.ms,
                ),
          ),

          // Floating Badge: Production Releases (Bottom Right)
          Positioned(
            bottom: 12,
            right: 12,
            child: _floatingBadge(
              icon: Icons.rocket_launch_rounded,
              color: const Color(0xFFA855F7),
              label: "15+ Production Apps",
              sublabel: "Play Store & App Store",
            ).animate(onPlay: (c) => c.repeat(reverse: true)).slideY(
                  begin: 0.06,
                  end: 0,
                  duration: 3200.ms,
                ),
          ),
        ],
      ),
    );
  }

  Widget _floatingBadge({
    required IconData icon,
    required Color color,
    required String label,
    required String sublabel,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 13),
          ),
          const SizedBox(width: 7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                sublabel,
                style: TextStyle(
                  fontSize: 8.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCodeMockup(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final containerHeight = isMobile ? 280.0 : 350.0;

    const codeSnippet = [
      ("01", "// Mobile Application Developer", Color(0xFF64748B)),
      ("02", "class MobileAppDeveloper {", Color(0xFF38BDF8)),
      ("03", "  final String name = 'Mohd Usama';", Color(0xFFE2E8F0)),
      ("04", "  final String currentCompany = 'Creators Mind';", Color(0xFFE2E8F0)),
      ("05", "  final List<String> coreStack = [", Color(0xFFE2E8F0)),
      ("06", "    'Flutter & Dart', 'Firebase (Auth/Firestore/FCM)',", Color(0xFF10B981)),
      ("07", "    'GetX, Riverpod, BLoC, Provider',", Color(0xFF10B981)),
      ("08", "    'Cloud Functions & Clean Architecture',", Color(0xFF10B981)),
      ("09", "    'REST APIs, Google Maps, App Stores',", Color(0xFF10B981)),
      ("10", "  ];", Color(0xFFE2E8F0)),
      ("11", "", Colors.transparent),
      ("12", "  Future<AppRelease> buildProductionApp() async {", Color(0xFFA855F7)),
      ("13", "    return AppRelease(", Color(0xFF38BDF8)),
      ("14", "      platforms: ['iOS', 'Android'],", Color(0xFFFFB703)),
      ("15", "      tools: ['Cursor AI', 'Antigravity IDE'],", Color(0xFFFFB703)),
      ("16", "      architecture: 'Clean Architecture',", Color(0xFF10B981)),
      ("17", "      stateManagement: ['GetX', 'Riverpod', 'BLoC'],", Color(0xFF10B981)),
      ("18", "    );", Color(0xFF38BDF8)),
      ("19", "  }", Color(0xFFA855F7)),
      ("20", "}", Color(0xFF38BDF8)),
    ];

    return Container(
      key: const ValueKey("code_mockup"),
      height: containerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF090D16) : const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: codeSnippet.map((line) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 24,
                          child: Text(
                            line.$1,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 10.5,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            line.$2,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 10.5,
                              fontWeight: FontWeight.w500,
                              color: line.$3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "🚀 Flutter • Firebase • Clean Arch",
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF38BDF8),
                  ),
                ),
                Text(
                  "15+ Apps Shipped • Ready",
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF10B981),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutDescription(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Status Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFF10B981).withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                    begin: const Offset(0.7, 0.7),
                    end: const Offset(1.3, 1.3),
                    duration: 1200.ms,
                  ),
              const SizedBox(width: 7),
              const Text(
                "Available for Full-Stack & Mobile Development Roles",
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF10B981),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Headline
        Text(
          "Passionate Mobile App Developer Building Scalable Solutions",
          style: TextStyle(
            fontSize: isMobile ? 21 : 26,
            fontWeight: FontWeight.w800,
            height: 1.25,
            letterSpacing: -0.5,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 12),

        // Body Text 1
        Text(
          "I am a Mobile App Developer experienced in architecting and delivering high-performance cross-platform mobile and web applications. My focus lies in full-stack mobile development using Flutter, Dart, and Firebase (Auth, Firestore, FCM), covering clean architecture, responsive UI, backend logic, and production store releases.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14.5,
                height: 1.6,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 10),

        // Body Text 2
        Text(
          "Over my career across Creators Mind and Sagar Informatics, I have delivered 15+ production apps across iOS & Android using GetX, Riverpod, BLoC, and Provider, integrating REST APIs, Firebase Cloud Functions, Google Maps, and AI-assisted workflows (Cursor AI, Antigravity IDE).",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14.5,
                height: 1.6,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 18),

        // Impact Statistics Grid (4 Key Metrics)
        _buildMetricsGrid(context, isMobile),

        const SizedBox(height: 18),

        // Key Focus Pills
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            _FeaturePill(icon: Icons.flutter_dash_rounded, label: "Flutter & Dart"),
            _FeaturePill(icon: Icons.cloud_done_rounded, label: "Firebase & Cloud Functions"),
            _FeaturePill(icon: Icons.architecture_rounded, label: "Clean Architecture"),
            _FeaturePill(icon: Icons.account_tree_rounded, label: "GetX • Riverpod • BLoC"),
            _FeaturePill(icon: Icons.map_rounded, label: "Google Maps & REST APIs"),
            _FeaturePill(icon: Icons.rocket_launch_rounded, label: "Play Store & App Store"),
            _FeaturePill(icon: Icons.auto_awesome_rounded, label: "AI-Assisted Dev"),
            _FeaturePill(icon: Icons.school_rounded, label: "Node.js • Express • Mongo (Learning)"),
          ],
        ),
      ],
    ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.08, end: 0);
  }

  Widget _buildMetricsGrid(BuildContext context, bool isMobile) {
    final metrics = [
      {"val": "4+", "title": "Years Experience", "color": const Color(0xFF38BDF8)},
      {"val": "15+", "title": "Apps Delivered", "color": const Color(0xFF6366F1)},
      {"val": "99.9%", "title": "Crash-Free Rate", "color": const Color(0xFF10B981)},
      {"val": "Solid", "title": "Clean Architecture", "color": const Color(0xFFA855F7)},
    ];

    return Row(
      children: metrics.map((metric) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            decoration: BoxDecoration(
              color: (metric["color"] as Color).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (metric["color"] as Color).withValues(alpha: 0.22),
              ),
            ),
            child: Column(
              children: [
                Text(
                  metric["val"] as String,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.w900,
                    color: metric["color"] as Color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  metric["title"] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 9.5 : 10.5,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildExperienceTimeline(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final experiences = [
      {
        "role": "Mobile App Developer",
        "company": "Creators Mind",
        "location": "Noida, Sector 63",
        "period": "Jun 2026 — Present",
        "type": "Full-Time",
        "achievements": [
          "Building full-stack mobile apps end-to-end using Flutter and Firebase (Auth, Firestore, FCM), covering architecture, UI, backend logic, and releases.",
          "Built 4 production apps using GetX and Riverpod, with Firebase Cloud Functions for backend logic and Clean Architecture.",
          "Accelerated development and debugging using AI-assisted tools (Cursor AI, Antigravity IDE).",
        ],
        "skills": [
          "Flutter",
          "Firebase",
          "Firestore",
          "FCM",
          "GetX",
          "Riverpod",
          "Cloud Functions",
          "Clean Architecture",
          "Cursor AI",
        ],
      },
      {
        "role": "Mobile App Developer",
        "company": "Sagar Informatics Private Limited",
        "location": "Noida, Sector 142",
        "period": "Feb 2023 — Apr 2026",
        "type": "Full-Time",
        "achievements": [
          "Delivered 15+ Flutter apps (iOS & Android) using Provider, GetX, BLoC, with REST APIs, Firebase, and Google Maps.",
          "Managed end-to-end releases on Google Play Store and Apple App Store, including updates and post-release support.",
        ],
        "skills": [
          "Flutter",
          "iOS & Android",
          "Provider",
          "GetX",
          "BLoC",
          "REST APIs",
          "Firebase",
          "Google Maps",
          "Play Store & App Store",
        ],
      },
      {
        "role": "Android Developer Intern & Flutter Trainee (OJT)",
        "company": "Sagar Informatics Private Limited",
        "location": "New Delhi",
        "period": "Sep 2021 — Feb 2023",
        "type": "OJT",
        "achievements": [
          "Started with Android (Java) development, then moved to Flutter, contributing to live client projects using state management, REST APIs, and Firebase.",
        ],
        "skills": [
          "Android (Java)",
          "Flutter",
          "State Management",
          "REST APIs",
          "Firebase",
          "Client Projects",
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                "Work Experience",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Professional journey across enterprise client & production mobile applications",
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experiences.length,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final exp = experiences[index];
            final achievements = exp["achievements"] as List<String>? ?? [];

            return GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              borderRadius: 16,
              borderColor: const Color(0xFF38BDF8).withValues(alpha: 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Role, Company & Type Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.work_history_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exp["role"] as String,
                              style: TextStyle(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              children: [
                                Text(
                                  exp["company"] as String,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF38BDF8),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "• ${exp["location"]}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                  ),
                                ),
                                Text(
                                  "• ${exp["period"]}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF6366F1).withValues(alpha: 0.25),
                          ),
                        ),
                        child: Text(
                          exp["type"] as String,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF6366F1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Key Achievements Bullets
                  ...achievements.map((ach) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 13,
                              color: Color(0xFF10B981),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              ach,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 10),

                  // Skills Badges (Compact)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: (exp["skills"] as List<String>).map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFF38BDF8).withValues(alpha: 0.2),
                          ),
                        ),
                        child: Text(
                          skill,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FeaturePill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeaturePill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF38BDF8).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF38BDF8)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF38BDF8),
            ),
          ),
        ],
      ),
    );
  }
}
