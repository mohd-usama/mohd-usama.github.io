import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Supports/glass_container.dart';
import '../responsive/responsive.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  final List<Map<String, dynamic>> testimonials = const [
    {
      "name": "Rajesh Sharma",
      "role": "Logistics Operations Lead",
      "company": "Starline Express",
      "rating": 5,
      "feedback":
          "Mohd Usama transformed our delivery run sheet & tracking app. His work on offline-first synchronization and Bluetooth ESC/POS printer receipts boosted our field team efficiency by over 40%. Exceptionally talented developer!",
    },
    {
      "name": "Ananya Barua",
      "role": "Project Director",
      "company": "Grassroots Tea Corp",
      "rating": 5,
      "feedback":
          "Usama built the Karbi Tea app with incredible care for usability. The app serves rural women entrepreneurs across Assam effortlessly. His technical discipline, clean state management, and fast turnarounds are top-notch.",
    },
    {
      "name": "Vikram Patel",
      "role": "Engineering Manager",
      "company": "SIPL Enterprises",
      "rating": 5,
      "feedback":
          "Working alongside Usama on Arcos Gig and Lesken distribution apps was a breeze. He writes clean, modular Flutter code, stays ahead of performance optimizations, and always delivers polished UI/UX.",
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
          // Section Title
          _sectionHeader(
            context,
            "Client & Colleague Feedback",
            "What project leads and engineering managers say about working with me",
          ),

          const SizedBox(height: 48),

          // Testimonials Cards Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: testimonials.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.3 : (isTablet ? 1.45 : 1.55),
            ),
            itemBuilder: (context, index) {
              final item = testimonials[index];
              return GlassContainer(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quote Icon & Rating Stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.format_quote_rounded,
                          color: Color(0xFF38BDF8),
                          size: 36,
                        ),
                        Row(
                          children: List.generate(
                            item["rating"] as int,
                            (i) => const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFD166),
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Testimonial Text
                    Text(
                      "\"${item["feedback"]}\"",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            height: 1.6,
                          ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    const Divider(height: 24),

                    // Author Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xFF6366F1).withOpacity(0.2),
                          child: Text(
                            (item["name"] as String).substring(0, 1),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6366F1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "${item["role"]} • ${item["company"]}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: (index * 100).ms, duration: 500.ms).slideY(begin: 0.1, end: 0);
            },
          ),
        ],
      ),
    );
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
