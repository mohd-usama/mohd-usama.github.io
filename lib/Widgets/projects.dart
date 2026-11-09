import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Supports/glass_container.dart';
import '../Supports/launcher.dart';
import '../responsive/responsive.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> projects = [
    {
      "title": "Arcos Gig",
      "category": "Gig Worker Platform",
      "description":
          "A seamless mobile platform designed to connect gig workers with job opportunities across registered branches in India. Features real-time job matching, location-based shift tracking, and payout processing.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.arcos.gig.app&pcampaignid=web_share",
      "image": "assets/icons/gig.png",
      "tags": ["Flutter", "REST API", "Firebase", "Geolocation"],
      "featured": true,
    },
    {
      "title": "Starline Express",
      "category": "Enterprise Logistics",
      "description":
          "High-performance logistics app that simplifies shipment booking, real-time package tracking, automated dispatch, arrival entries, and delivery run sheets with offline printing support.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.starline_express.starline_express&pcampaignid=web_share",
      "image": "assets/icons/starline.png",
      "tags": ["Flutter", "Bluetooth Thermal Print", "SQLite", "Offline Sync"],
      "featured": true,
    },
    {
      "title": "Karbi Tea",
      "category": "Agri-Tech & E-Commerce",
      "description":
          "Developed for Grassroots Tea Corporation to empower Rural Women Entrepreneurs (RWEs) in Assam processing chemical-free handcrafted green tea. Handles inventory, distribution, and direct sales.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.grassroots.grassroots_tea_corporation&pcampaignid=web_share",
      "image": "assets/icons/karbi.png",
      "tags": ["Flutter", "E-Commerce", "REST API", "Razorpay"],
      "featured": false,
    },
    {
      "title": "Lesken Enterprises",
      "category": "B2B Sales Distribution",
      "description":
          "Sales distribution app utilized by field agents to manage inventory allocation, assign stock to retailers, process daily sales orders, and manage stock returns in real time.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.lesken_enterprises&pcampaignid=web_share",
      "image": "assets/icons/lesken.png",
      "tags": ["Flutter", "State Management", "SQLite", "REST API"],
      "featured": false,
    },
    {
      "title": "Astute Ecare",
      "category": "Enterprise HR & Onboarding",
      "description":
          "Streamlines the candidate selection and recruitment process by capturing candidate details, scanning verification documents, and orchestrating HR approval workflows.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.astute_ecare&pcampaignid=web_share",
      "image": "assets/icons/astute.png",
      "tags": ["Flutter", "Camera SDK", "Firebase Auth", "REST API"],
      "featured": false,
    },
    {
      "title": "Cost Mitra",
      "category": "Fintech & Expense Tracking",
      "description":
          "A intuitive expense management app for tracking shared group bills, calculating split ratios, and facilitating smooth peer-to-peer settlements among flatmates and travel groups.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.costmitra&pcampaignid=web_share",
      "image": "assets/icons/cost.png",
      "tags": ["Flutter", "GetX", "Local Storage", "Analytics"],
      "featured": false,
    },
    {
      "title": "Courier Mitra",
      "category": "Courier Operations",
      "description":
          "End-to-end courier operations manager enabling booking entry, real-time shipment status updates, hub arrival logs, and delivery agent run sheet generation.",
      "link": "https://play.google.com/store/apps/details?id=sipl.couriermitra&pcampaignid=web_share",
      "image": "assets/icons/courier.png",
      "tags": ["Flutter", "QR Code Scanner", "Push Notifications"],
      "featured": false,
    },
    {
      "title": "Vichare Loginext",
      "category": "Express Delivery Platform",
      "description":
          "Integrated shipping solution for corporate clients and consumers. Features fast order booking, live courier tracking, digital signatures upon delivery, and historical analytics.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.vichare_loginext&pcampaignid=web_share",
      "image": "assets/icons/vichare.png",
      "tags": ["Flutter", "Google Maps SDK", "REST API", "PDF Reports"],
      "featured": false,
    },
    {
      "title": "IndoCraft World",
      "category": "Artisan Marketplace",
      "description":
          "E-commerce marketplace showcasing handcrafted items from artisans across India. Provides product browsing, cart management, secure checkout, and order tracking.",
      "link": "https://play.google.com/store/apps/details?id=com.sipl.indo_craft_world&pcampaignid=web_share",
      "image": "assets/icons/indo.png",
      "tags": ["Flutter", "E-Commerce", "Payment Gateway", "Firebase"],
      "featured": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          // Section Title Header
          _sectionHeader(
            context,
            "Featured Production Projects",
            "A showcase of scalable enterprise, logistics, and consumer mobile apps deployed on Play Store",
          ),

          const SizedBox(height: 48),

          // Projects Bento Grid / Cards
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.22 : (isTablet ? 1.45 : 1.65),
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              return _projectCard(context, project, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _projectCard(BuildContext context, Map<String, dynamic> project, int index) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassContainer(
      padding: const EdgeInsets.all(18),
      onTap: () => openWebsite(project["link"] as String),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Top Bar: Icon + Category Badge + Link Icon
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isDark ? const Color(0x331E293B) : const Color(0xFFF1F5F9),
                  border: Border.all(
                    color: const Color(0x3338BDF8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    project["image"] as String,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.smartphone_rounded,
                      color: Color(0xFF38BDF8),
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project["title"] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      project["category"] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF38BDF8),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? const Color(0x1A38BDF8) : const Color(0x0D000000),
                ),
                child: const Icon(
                  Icons.arrow_outward_rounded,
                  size: 16,
                  color: Color(0xFF38BDF8),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Description
          Text(
            project["description"] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  height: 1.45,
                ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const Spacer(),

          const Divider(height: 16),

          // Tech Stack Tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: (project["tags"] as List<String>)
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0x261E293B) : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDark ? const Color(0x1A38BDF8) : const Color(0x1A000000),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 80).ms, duration: 500.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _sectionHeader(BuildContext context, String title, String subtitle) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
          ).createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: const LinearGradient(
              colors: [Color(0xFF38BDF8), Color(0xFF6366F1)],
            ),
          ),
        ),
      ],
    );
  }
}
