import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Supports/glass_container.dart';
import '../Supports/gradieent_button.dart';
import '../Supports/launcher.dart';
import '../responsive/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final msgCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    msgCtrl.dispose();
    super.dispose();
  }

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
            "Let's Connect & Collaborate",
            "Available for Senior Mobile Roles, Technical Consulting & Contract Projects",
          ),

          const SizedBox(height: 48),

          if (isMobile)
            Column(
              children: [
                _buildContactInfo(context),
                const SizedBox(height: 32),
                _buildContactForm(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildContactInfo(context),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 7,
                  child: _buildContactForm(context),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get in Touch Directly 📩",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Have a project idea, mobile app architecture inquiry, or career opportunity? Feel free to reach out via WhatsApp, email, or social media.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 15,
                height: 1.6,
              ),
        ),
        const SizedBox(height: 28),

        // Quick Info Cards
        _infoCard(
          context,
          icon: Icons.email_rounded,
          title: "Email Address",
          value: "mohdusama5360@gmail.com",
          onTap: () => openWebsite("mailto:mohdusama5360@gmail.com"),
        ),
        const SizedBox(height: 16),
        _infoCard(
          context,
          icon: Icons.phone_android_rounded,
          title: "Phone / WhatsApp",
          value: "+91 9899152923",
          onTap: () => openWebsite("https://wa.me/919899152923"),
        ),
        const SizedBox(height: 16),
        _infoCard(
          context,
          icon: Icons.location_on_rounded,
          title: "Location",
          value: "New Delhi, India (Available for Global Remote)",
        ),

        const SizedBox(height: 32),

        // Social Icons Row
        const Text(
          "Follow & Connect:",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          children: [
            _socialIconBtn(
              context,
              icon: Icons.code_rounded,
              label: "GitHub",
              onTap: () => openWebsite("https://github.com/mohd-usama"),
            ),
            _socialIconBtn(
              context,
              icon: Icons.work_rounded,
              label: "LinkedIn",
              onTap: () => openWebsite("https://linkedin.com/in/mohdusama"),
            ),
            _socialIconBtn(
              context,
              icon: Icons.chat_bubble_rounded,
              label: "WhatsApp",
              onTap: () => openWebsite("https://wa.me/919899152923"),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _infoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return GlassContainer(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF38BDF8).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF38BDF8), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIconBtn(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? const Color(0x261E293B) : const Color(0xFFF1F5F9),
          border: Border.all(
            color: isDark ? const Color(0x3338BDF8) : const Color(0x1A000000),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF38BDF8)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Send a Direct Message 🚀",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Name Field
            TextFormField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: "Your Full Name",
                hintText: "e.g. John Doe",
                prefixIcon: Icon(Icons.person_outline_rounded, size: 20),
              ),
              validator: (val) => (val == null || val.isEmpty) ? "Please enter your name" : null,
            ),
            const SizedBox(height: 18),

            // Email Field
            TextFormField(
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email Address",
                hintText: "e.g. john@example.com",
                prefixIcon: Icon(Icons.email_outlined, size: 20),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) return "Please enter your email";
                if (!val.contains("@")) return "Enter a valid email address";
                return null;
              },
            ),
            const SizedBox(height: 18),

            // Message Field
            TextFormField(
              controller: msgCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Message / Inquiry Details",
                hintText: "Tell me about your mobile project, timeline, or position...",
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.chat_outlined, size: 20),
                ),
              ),
              validator: (val) => (val == null || val.isEmpty) ? "Please enter a message" : null,
            ),
            const SizedBox(height: 28),

            // Send Button
            GradientButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await sendWhatsAppMessage(
                    name: nameCtrl.text.trim(),
                    phone: "919899152923",
                    email: emailCtrl.text.trim(),
                    message: msgCtrl.text.trim(),
                  );

                  nameCtrl.clear();
                  emailCtrl.clear();
                  msgCtrl.clear();

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Redirecting to WhatsApp to send message..."),
                        backgroundColor: Color(0xFF10B981),
                      ),
                    );
                  }
                }
              },
              text: "Send Message via WhatsApp",
              icon: Icons.send_rounded,
              height: 50,
              width: double.infinity,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.1, end: 0);
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
