import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:random_color/random_color.dart';
import 'dart:math';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Center(
      child: Stack(
        children: [
          makeLines(0),
          makeLines(pi),
          makeLines(pi/2),
          makeLines(pi*2),
        ],
      ),
    );
  }

  makeLines(double angle) {
    return Transform.rotate(
      angle: angle,
      child: CustomPaint(
        size: Size(300, 300),
        painter: LinePainter(),
      ),
    );
  }
}

class Rnd {
  static Random _random = new Random();

  static int next(int min, int max) => min + _random.nextInt(max - min);

  static double getDouble(double min, double max) {
    return _random.nextDouble();
  }
}

class LineHelper {
  static RandomColor randomColor = RandomColor();
  Color random = randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.lowSaturation);

  static Color color() {
    return randomColor.randomColor(
        colorBrightness: ColorBrightness.light,
        colorSaturation: ColorSaturation.lowSaturation);
  }

  static int min(int min) {
    return min;
  }

  static int max(int max) {
    return max;
  }

  static Random _random = new Random();

  static int next(int min, int max) => min + _random.nextInt(max - min);

  static Offset base(double x, double y) {
    Offset base = ui.Offset(x, y);
    return base;
  }

  static List list() {
    for (double i = 0; i >= 300; i + 25) {
      return [for (double i = 0; i >= 300; i + 25) Text('i')];
    }
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double basePoint = 150;
    int min = 5;
    int max = 150;
    int i = 25;
    double rndDub = Rnd.next(min, max).toDouble();
    double rndDub2 = Rnd.next(min, max).toDouble();
    double rndDub3 = Rnd.next(0, 50).toDouble();

    final double line2 = LineHelper.next(7 * i, 8 * i).toDouble();
    final double line3 = LineHelper.next(150, 300).toDouble();
    final double line4 = LineHelper.next(0, 100).toDouble();

    final base = LineHelper.base(150, 150);
    final base2 = Offset(rndDub3, basePoint);
    final base3 = LineHelper.base(line2, basePoint);
    final pointMode = ui.PointMode.points;

    final p1 = Offset(basePoint, rndDub);
    final p2 = Offset(rndDub2, rndDub2);
    final p3 = LineHelper.base(line3, line4);

    final linePaint = Paint()
      ..color = LineHelper.color()
      ..strokeWidth = (2);
    final pointPaint = Paint()
      ..color = LineHelper.color()
      ..strokeWidth = (20)
      ..strokeCap = ui.StrokeCap.round;
    final points = [
      base,
      p1,
      p2,
      p3,
      base2,
      base3,
    ];
    canvas.drawLine(base, p1, linePaint);
    canvas.drawLine(base2, p2, linePaint);

    canvas.drawLine(base3, p3, linePaint);

    canvas.drawLine(base, base2, linePaint);
    canvas.drawLine(base, base3, linePaint);
    canvas.drawPoints(pointMode, points, pointPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RandomDesign extends StatefulWidget {
  @override
  _RandomDesignState createState() => _RandomDesignState();
}

class _RandomDesignState extends State<RandomDesign> {
  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
