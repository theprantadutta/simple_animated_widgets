import 'package:flutter/material.dart';

class FadingButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Duration duration;
  final double fadeTo;

  const FadingButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.duration = const Duration(milliseconds: 200),
    this.fadeTo = 0.5,
  });

  @override
  State<FadingButton> createState() => _FadingButtonState();
}

class _FadingButtonState extends State<FadingButton>
    with SingleTickerProviderStateMixin {
  double _opacity = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _opacity = widget.fadeTo;
    });
  }

  void _onTapUp(TapUpDetails details) {
    _restoreOpacity();
    widget.onPressed();
  }

  void _onTapCancel() {
    _restoreOpacity();
  }

  void _restoreOpacity() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }
}
