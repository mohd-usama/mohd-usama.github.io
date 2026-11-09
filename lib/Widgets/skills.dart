import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Supports/glass_container.dart';
import '../responsive/responsive.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {
      "name": "All Skills",
      "icon": Icons.category_rounded,
    },
    {
      "name": "Mobile Development",
      "icon": Icons.phone_iphone_rounded,
    },
    {
      "name": "State & Architecture",
      "icon": Icons.account_tree_rounded,
    },
    {
      "name": "Backend & Database",
      "icon": Icons.storage_rounded,
    },
    {
      "name": "Integrations",
      "icon": Icons.hub_rounded,
    },
    {
      "name": "AI & Tools",
      "icon": Icons.auto_awesome_rounded,
    },
    {
      "name": "Currently Learning",
      "icon": Icons.school_rounded,
    },
  ];

  final List<Map<String, dynamic>> _allSkills = [
    // Mobile Development
    {
      "name": "Flutter",
      "category": "Mobile Development",
      "icon": Icons.flutter_dash_rounded,
      "color": const Color(0xFF02569B),
    },
    {
      "name": "Dart",
      "category": "Mobile Development",
      "icon": Icons.code_rounded,
      "color": const Color(0xFF0175C2),
    },
    {
      "name": "Android Native (Kotlin)",
      "category": "Mobile Development",
      "icon": Icons.android_rounded,
      "color": const Color(0xFF3DDC84),
    },
    {
      "name": "Android Native (Java)",
      "category": "Mobile Development",
      "icon": Icons.coffee_rounded,
      "color": const Color(0xFFF58220),
    },
    {
      "name": "Play Store & App Store",
      "category": "Mobile Development",
      "icon": Icons.publish_rounded,
      "color": const Color(0xFFA855F7),
    },

    // State Management & Architecture
    {
      "name": "GetX",
      "category": "State & Architecture",
      "icon": Icons.flash_on_rounded,
      "color": const Color(0xFFEC4899),
    },
    {
      "name": "BLoC Pattern",
      "category": "State & Architecture",
      "icon": Icons.account_tree_rounded,
      "color": const Color(0xFF6366F1),
    },
    {
      "name": "Provider",
      "category": "State & Architecture",
      "icon": Icons.grid_view_rounded,
      "color": const Color(0xFF10B981),
    },
    {
      "name": "Riverpod",
      "category": "State & Architecture",
      "icon": Icons.waves_rounded,
      "color": const Color(0xFF0EA5E9),
    },
    {
      "name": "Clean Architecture",
      "category": "State & Architecture",
      "icon": Icons.architecture_rounded,
      "color": const Color(0xFF8B5CF6),
    },

    // Backend & Database
    {
      "name": "Firebase (Auth, Firestore, FCM)",
      "category": "Backend & Database",
      "icon": Icons.local_fire_department_rounded,
      "color": const Color(0xFFFFCA28),
    },
    {
      "name": "Cloud Functions",
      "category": "Backend & Database",
      "icon": Icons.cloud_sync_rounded,
      "color": const Color(0xFFF59E0B),
    },
    {
      "name": "RESTful APIs",
      "category": "Backend & Database",
      "icon": Icons.api_rounded,
      "color": const Color(0xFF10B981),
    },
    {
      "name": "Sqflite (SQLite)",
      "category": "Backend & Database",
      "icon": Icons.sd_storage_rounded,
      "color": const Color(0xFF003B5C),
    },
    {
      "name": "Node.js (REST APIs)",
      "category": "Backend & Database",
      "icon": Icons.terminal_rounded,
      "color": const Color(0xFF22C55E),
      "isLearning": true,
    },
    {
      "name": "Express.js",
      "category": "Backend & Database",
      "icon": Icons.alt_route_rounded,
      "color": const Color(0xFF94A3B8),
      "isLearning": true,
    },
    {
      "name": "MongoDB",
      "category": "Backend & Database",
      "icon": Icons.data_object_rounded,
      "color": const Color(0xFF10B981),
      "isLearning": true,
    },

    // Integrations
    {
      "name": "Razorpay Payment Gateway",
      "category": "Integrations",
      "icon": Icons.payments_rounded,
      "color": const Color(0xFF38BDF8),
    },
    {
      "name": "Google Maps API",
      "category": "Integrations",
      "icon": Icons.map_rounded,
      "color": const Color(0xFF4285F4),
    },
    {
      "name": "Push Notifications (FCM)",
      "category": "Integrations",
      "icon": Icons.notifications_active_rounded,
      "color": const Color(0xFFF59E0B),
    },

    // AI-Assisted Development & Tools
    {
      "name": "Cursor AI",
      "category": "AI & Tools",
      "icon": Icons.auto_awesome_rounded,
      "color": const Color(0xFF38BDF8),
    },
    {
      "name": "Antigravity IDE",
      "category": "AI & Tools",
      "icon": Icons.psychology_rounded,
      "color": const Color(0xFF6366F1),
    },
    {
      "name": "Android Studio Agent AI",
      "category": "AI & Tools",
      "icon": Icons.smart_toy_rounded,
      "color": const Color(0xFF3DDC84),
    },
    {
      "name": "Git, GitHub & SVN",
      "category": "AI & Tools",
      "icon": Icons.source_rounded,
      "color": const Color(0xFFF05032),
    },
    {
      "name": "Postman API Testing",
      "category": "AI & Tools",
      "icon": Icons.send_rounded,
      "color": const Color(0xFFFF6C37),
    },
    {
      "name": "Android Studio & Xcode",
      "category": "AI & Tools",
      "icon": Icons.devices_rounded,
      "color": const Color(0xFF147EFB),
    },
    {
      "name": "Figma UI Prototyping",
      "category": "AI & Tools",
      "icon": Icons.design_services_rounded,
      "color": const Color(0xFFF24E1E),
    },
    {
      "name": "Agile, Scrum & CI/CD",
      "category": "AI & Tools",
      "icon": Icons.sync_rounded,
      "color": const Color(0xFF10B981),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final String selectedCategoryName = _categories[_selectedCategoryIndex]["name"];

    final filteredSkills = selectedCategoryName == "All Skills"
        ? _allSkills
        : selectedCategoryName == "Currently Learning"
            ? _allSkills.where((s) => s["isLearning"] == true).toList()
            : _allSkills.where((s) => s["category"] == selectedCategoryName).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : (isTablet ? 36 : 70),
        vertical: isMobile ? 28 : 46,
      ),
      child: Column(
        children: [
          // Section Title
          _sectionHeader(
            context,
            "Technical Skills & Ecosystem",
            "Core mobile technologies, architectures, and full-stack tools I leverage in production",
          ),

          const SizedBox(height: 16),

          // Currently Learning Highlight Banner
          _buildCurrentlyLearningBanner(context, isMobile),

          const SizedBox(height: 20),

          // Category Filter Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_categories.length, (index) {
                final cat = _categories[index];
                final isSelected = _selectedCategoryIndex == index;
                final isLearningTab = cat["name"] == "Currently Learning";

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: isSelected
                            ? (isLearningTab
                                ? const LinearGradient(
                                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                                  )
                                : const LinearGradient(
                                    colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
                                  ))
                            : null,
                        color: isSelected
                            ? null
                            : (Theme.of(context).brightness == Brightness.dark ? const Color(0xFF111827) : const Color(0xFFF1F5F9)),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : (isLearningTab
                                  ? const Color(0xFF10B981).withValues(alpha: 0.35)
                                  : (Theme.of(context).brightness == Brightness.dark
                                      ? const Color(0xFF38BDF8).withValues(alpha: 0.2)
                                      : const Color(0x1A000000))),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            cat["icon"] as IconData,
                            size: 15,
                            color: isSelected
                                ? Colors.white
                                : (isLearningTab
                                    ? const Color(0xFF10B981)
                                    : (Theme.of(context).brightness == Brightness.dark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7))),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            cat["name"] as String,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 20),

          // Skills Grid Layout
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: GridView.builder(
              key: ValueKey(_selectedCategoryIndex),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredSkills.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 2 : (isTablet ? 3 : 4),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: isMobile ? 2.5 : (isTablet ? 3.0 : 3.4),
              ),
              itemBuilder: (context, index) {
                final skill = filteredSkills[index];
                final bool isLearning = skill["isLearning"] == true;

                return GlassContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  borderRadius: 14,
                  borderColor: isLearning ? const Color(0xFF10B981).withValues(alpha: 0.35) : const Color(0xFF38BDF8).withValues(alpha: 0.2),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: (skill["color"] as Color).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          skill["icon"] as IconData,
                          color: skill["color"] as Color,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    skill["name"] as String,
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isLearning) ...[
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF10B981).withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: const Color(0xFF10B981).withValues(alpha: 0.35),
                                      ),
                                    ),
                                    child: const Text(
                                      "Learning",
                                      style: TextStyle(
                                        fontSize: 8.5,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF10B981),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              skill["category"] as String,
                              style: TextStyle(
                                fontSize: 10.5,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: (index * 20).ms, duration: 250.ms).slideY(begin: 0.08, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentlyLearningBanner(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF10B981).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF10B981).withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Color(0xFF10B981),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.school_rounded, size: 12, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: isMobile ? 11.5 : 12.5,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                children: const [
                  TextSpan(
                    text: "Currently Exploring & Learning: ",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF10B981)),
                  ),
                  TextSpan(
                    text: "Node.js (REST APIs) • Express.js • MongoDB (Backend Expansion)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
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
              Icon(Icons.code_rounded, size: 15, color: Color(0xFF38BDF8)),
              SizedBox(width: 6),
              Text(
                "TECH STACK & CAPABILITIES",
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
}
