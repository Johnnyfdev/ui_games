import 'package:flutter/material.dart';

class Game3DButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Color color;
  final Color shadowColor;
  final Widget? child;
  const Game3DButton({
    super.key,
    this.onPressed,
    this.color = Colors.blue,
    this.shadowColor = Colors.blueGrey,
    this.child,
  });

  Game3DButton.text({
    super.key,
    this.onPressed,
    required String text,
    Color textColor = Colors.white,
    this.shadowColor = Colors.blueGrey,
    this.color = Colors.blue,
  }) : child = Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );

  @override
  State<Game3DButton> createState() => _Game3DButtonState();
}

class _Game3DButtonState extends State<Game3DButton> {
  double padding = 4.0;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.onPressed == null ? 0.5 : 1,
      child: IgnorePointer(
        ignoring: widget.onPressed == null,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: widget.onPressed,
          onTapDown: (_) {
            setState(() {
              padding = 0.0;
            });
          },
          onTapUp: (_) {
            setState(() {
              padding = 4.0;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.only(bottom: padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.shadowColor,
            ),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.color,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
