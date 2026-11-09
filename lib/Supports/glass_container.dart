import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? borderColor;
  final List<Color>? borderGradient;
  final Color? backgroundColor;
  final double blur;
  final VoidCallback? onTap;
  final bool enableHover;
  final BoxBorder? customBorder;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(20),
    this.margin = EdgeInsets.zero,
    this.borderColor,
    this.borderGradient,
    this.backgroundColor,
    this.blur = 12,
    this.onTap,
    this.enableHover = true,
    this.customBorder,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultBg = isDark
        ? (_isHovered ? const Color(0x261E293B) : const Color(0x1A1E293B))
        : (_isHovered ? const Color(0xF5FFFFFF) : const Color(0xE6FFFFFF));

    final defaultBorderColor = isDark
        ? (_isHovered ? const Color(0xFF38BDF8) : const Color(0x3338BDF8))
        : (_isHovered ? const Color(0xFF0284C7) : const Color(0x1A000000));

    final glowShadow = _isHovered
        ? [
            BoxShadow(
              color: isDark
                  ? const Color(0x4038BDF8)
                  : const Color(0x200284C7),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]
        : [
            BoxShadow(
              color: isDark ? Colors.black : Colors.black12,
              blurRadius: 10,
              spreadRadius: 0,
            )
          ];

    Widget content = ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: widget.blur, sigmaY: widget.blur),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? defaultBg,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: widget.customBorder ??
                Border.all(
                  color: widget.borderColor ?? defaultBorderColor,
                  width: _isHovered ? 1.5 : 1.0,
                ),
            boxShadow: glowShadow,
          ),
          child: widget.child,
        ),
      ),
    );

    if (widget.onTap != null || widget.enableHover) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: widget.onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _isHovered ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            child: content,
          ),
        ),
      );
    }

    return content;
  }
}
