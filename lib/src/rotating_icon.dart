import 'package:flutter/material.dart';

class RotatingIcon extends StatefulWidget {
  final Icon icon;
  final Duration duration;
  final double angle;
  final bool isRotating;
  final void Function()? onTap;

  const RotatingIcon({
    super.key,
    required this.icon,
    this.duration = const Duration(seconds: 1),
    this.angle = 360.0,
    this.isRotating = true,
    this.onTap,
  });

  @override
  State<RotatingIcon> createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _rotation = Tween<double>(begin: 0.0, end: widget.angle)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    if (widget.isRotating) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant RotatingIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRotating && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isRotating && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotation.value *
                (3.141592653589793 / 180), // Degrees to radians
            child: child,
          );
        },
        child: widget.icon,
      ),
    );
  }
}
