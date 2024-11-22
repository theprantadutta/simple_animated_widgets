import 'package:flutter/material.dart';

class BouncingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final VoidCallback? onTap;
  final Duration duration;
  final double scaleFactor;

  const BouncingText({
    super.key,
    required this.text,
    this.style,
    this.onTap,
    this.duration = const Duration(milliseconds: 200),
    this.scaleFactor = 1.2,
  });

  @override
  State<BouncingText> createState() => _BouncingTextState();
}

class _BouncingTextState extends State<BouncingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    }
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Text(
              widget.text,
              style: widget.style,
            ),
          );
        },
      ),
    );
  }
}
