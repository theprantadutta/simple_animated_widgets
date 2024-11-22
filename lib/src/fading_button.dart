import 'package:flutter/material.dart';

/// A button widget that fades in and out when pressed.
///
/// The `FadingButton` widget changes its opacity when pressed and restores it when released.
/// The fade effect duration and the target opacity when pressed can be customized.
///
/// Parameters:
/// - [child]: The child widget that will be displayed inside the button. This is typically a text or icon.
/// - [onPressed]: The callback that is triggered when the button is tapped and released.
/// - [duration]: The duration of the fade animation. Defaults to 200 milliseconds.
/// - [fadeTo]: The target opacity when the button is pressed. Defaults to 0.5 (semi-transparent).
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

  /// Handles the tap down event and changes the opacity to [fadeTo].
  void _onTapDown(TapDownDetails details) {
    setState(() {
      _opacity = widget.fadeTo;
    });
  }

  /// Handles the tap up event, restores opacity, and calls the [onPressed] callback.
  void _onTapUp(TapUpDetails details) {
    _restoreOpacity();
    widget.onPressed();
  }

  /// Handles the tap cancel event and restores the opacity if the tap is canceled.
  void _onTapCancel() {
    _restoreOpacity();
  }

  /// Restores the opacity of the button back to 1.0 (fully visible).
  void _restoreOpacity() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown, // Change opacity when the button is pressed down
      onTapUp:
          _onTapUp, // Restore opacity and trigger onPressed callback on tap release
      onTapCancel: _onTapCancel, // Restore opacity if the tap is canceled
      child: AnimatedOpacity(
        duration: widget.duration, // Duration of the opacity change
        opacity: _opacity, // The current opacity value
        child: widget.child, // The content of the button
      ),
    );
  }
}
