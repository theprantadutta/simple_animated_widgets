import 'package:flutter/material.dart';

/// A widget that displays an icon and rotates it continuously or on tap.
///
/// The `RotatingIcon` widget rotates the icon by a specified angle over a given duration.
/// The rotation can be continuous (when [isRotating] is true) or triggered manually when tapped (using [onTap]).
///
/// Parameters:
/// - [icon]: The icon to be displayed and rotated.
/// - [duration]: The duration for one complete rotation. Defaults to 1 second.
/// - [angle]: The total rotation angle, in degrees. Defaults to 360 degrees (one full rotation).
/// - [isRotating]: A flag to indicate whether the icon should rotate continuously. Defaults to true.
/// - [onTap]: A callback function to be called when the icon is tapped (optional).
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
    // Initialize the animation controller with the provided duration
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    // Define the rotation animation to rotate from 0 to the given angle
    _rotation = Tween<double>(begin: 0.0, end: widget.angle)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // If continuous rotation is enabled, repeat the animation
    if (widget.isRotating) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant RotatingIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle changes in the widget's properties to control animation
    if (widget.isRotating && !_controller.isAnimating) {
      _controller.repeat(); // Start animation if rotating is enabled
    } else if (!widget.isRotating && _controller.isAnimating) {
      _controller.stop(); // Stop animation if rotating is disabled
    }
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is destroyed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Trigger the tap callback if provided
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          // Apply the rotation transformation to the icon
          return Transform.rotate(
            angle: _rotation.value *
                (3.141592653589793 / 180), // Convert degrees to radians
            child: child,
          );
        },
        child: widget.icon, // Display the icon inside the rotating widget
      ),
    );
  }
}
