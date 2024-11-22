import 'package:flutter/material.dart';

/// A widget that displays text with a bouncing (scaling) animation on tap.
///
/// The `BouncingText` widget animates the scaling of the text when the user taps
/// on it. The scale factor and duration of the animation can be customized.
///
/// Parameters:
/// - [text]: The text to display.
/// - [style]: The style to apply to the text (optional).
/// - [onTap]: A callback function that gets triggered when the text is tapped (optional).
/// - [duration]: The duration of the bounce animation. Defaults to 200 milliseconds.
/// - [scaleFactor]: The scale factor to apply during the bounce animation. Defaults to 1.2.
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
    // Initialize the animation controller with the given duration
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    // Define the animation to scale from 1.0 to the given scale factor
    _animation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is destroyed
    _controller.dispose();
    super.dispose();
  }

  /// Handles the tap gesture and triggers the bounce animation.
  void _handleTap() {
    // Execute the custom tap callback if provided
    if (widget.onTap != null) {
      widget.onTap!();
    }
    // Start the forward animation and then reverse it
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap, // Trigger the animation on tap
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Apply the scaling animation to the text widget
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
