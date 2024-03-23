import 'package:flutter/material.dart';

class GameBar3DIndicator extends StatefulWidget {
  final Color backgroundColor;
  final Color barColor;
  final double height;
  final double percent;
  const GameBar3DIndicator({
    super.key,
    this.height = 60,
    this.percent = 0.5,
    this.barColor = Colors.green,
    this.backgroundColor = Colors.deepOrange,
  });

  @override
  State<GameBar3DIndicator> createState() => _GameBar3DIndicatorState();
}

class _GameBar3DIndicatorState extends State<GameBar3DIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: widget.height,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                increaseBrightness(widget.backgroundColor, 1.5),
                widget.backgroundColor,
                widget.backgroundColor,
                widget.backgroundColor,
                widget.backgroundColor,
                widget.backgroundColor,
                reduceBrightness(widget.backgroundColor, 1.2),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: reduceBrightness(widget.backgroundColor, 1.2),
              width: 2,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  reduceBrightness(widget.backgroundColor, 1.2),
                  reduceBrightness(widget.backgroundColor, 1.2),
                  reduceBrightness(widget.backgroundColor, 1.2),
                  reduceBrightness(widget.backgroundColor, 1.2),
                  reduceBrightness(widget.backgroundColor, 1.2),
                  increaseBrightness(widget.backgroundColor, 1.2),
                ],
              ),
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              var width = constraints.maxWidth * widget.percent;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(
                  right: constraints.maxWidth - width,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      reduceBrightness(widget.barColor, 1.1),
                      widget.barColor,
                      increaseBrightness(widget.barColor, 1.3),
                      increaseBrightness(widget.barColor, 1.1),
                      widget.barColor,
                      widget.barColor,
                      widget.barColor,
                      reduceBrightness(widget.barColor, 1.1),
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: reduceBrightness(widget.barColor, 1.2),
                      width: 1,
                    ),
                    gradient: RadialGradient(
                      focal: Alignment.center,
                      center: Alignment.center,
                      focalRadius: -1,
                      radius: 22,
                      colors: [
                        reduceBrightness(widget.barColor, 1.2),
                        widget.barColor.withOpacity(0.0),
                        widget.barColor.withOpacity(0.0),
                        widget.barColor.withOpacity(0.0),
                        reduceBrightness(widget.barColor, 1.2),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Text(
          'Loading... ${(widget.percent * 100).toInt()}%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color increaseBrightness(Color color, double factor) {
    return Color.fromRGBO(
      (color.red * factor).round().clamp(0, 255),
      (color.green * factor).round().clamp(0, 255),
      (color.blue * factor).round().clamp(0, 255),
      1,
    );
  }

  Color reduceBrightness(Color color, double factor) {
    return Color.fromRGBO(
      (color.red / factor).round().clamp(0, 255),
      (color.green / factor).round().clamp(0, 255),
      (color.blue / factor).round().clamp(0, 255),
      1,
    );
  }
}
