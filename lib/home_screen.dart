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
  final double shirtContainerSize = 75;
  List<TShirt> shirtList = [
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
    TShirt(),
  ];

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
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepOrangeAccent,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 60,
            ),
            dragWidget(),
          ],
        ),
      ],
    ));
  }

  shirtContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: screenSize(context).height * .8,
        width: screenSize(context).width * .85,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.7),
        ),
      ),
    );
  }

  dragWidget() {
    return Draggable(
      child: shirtviewer2(),
      feedback: shirtviewer2(),
      childWhenDragging: shirtContainer(),
    );
  }

  shirtviewer2() {
    String shirt = "assets/images/gshirt.png";

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: screenSize(context).height * .8,
        width: screenSize(context).width * .85,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(shirt),
          ),
          color: Colors.grey.withOpacity(.7),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: screenSize(context).height * .8,
                width: screenSize(context).width * .05,
                color: Colors.greenAccent.withOpacity(.2),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 175,
                  ),
                  /*Transform.scale(scale: 2,child: TShirt(),)*/
                  Opacity(
                    opacity: .4,
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  dragContainer(Color color, Widget child) {
    return Container(
      height: screenSize(context).height,
      width: screenSize(context).width * .2,
      color: color,
      child: child,
    );
  }

  shirtViewer() {
    List<TShirt> shirtList = [
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
      TShirt(),
    ];

    /* return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context,index){
          return Container(width: 15,);
        },
        scrollDirection: Axis.horizontal,
        itemCount: shirtList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              child: shirtList[index],
            ),
          );
        },
      ),
    );*/

    /* return Container(
      height: 500,
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index) {
        return Center(
          child: Container(
            height: 100,
            width: 100,
            child: shirtList[index],
          ),
        );
      },
      ),

    );
*/
    return Container(
      height: 600,
      width: screenSize(context).width * .9,
      child: GridView.count(
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        primary: false,
        crossAxisCount: 3,
        children: List.generate(12, (index) {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              child: Draggable(
                onDragCompleted: () {},
                feedback: shirtList[index],
                childWhenDragging: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[300],
                ),
                child: shirtList[index],
              ),
            ),
          );
        }),
      ),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}

class TShirt extends StatelessWidget {
  final double shirtContainerSize = 75;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: finalContainer(),
    );
  }

  makeLines(double angle) {
    return Transform.rotate(
      angle: angle,
      child: Transform.scale(
        scale: .2,
        child: Opacity(
          opacity: .6,
          child: CustomPaint(
            size: Size(shirtContainerSize, shirtContainerSize),
            painter: LinePainter(),
          ),
        ),
      ),
    );
  }

  finalContainer() {
    return Container(
        height: 95,
        width: 95,
        decoration: BoxDecoration(
            // color: Colors.white.withOpacity(.9),
            /*   border: Border.all(
            width: 1,
            color: Colors.black,
          ),*/
            /*     boxShadow: [BoxShadow(
          blurRadius: 10,
          spreadRadius: 7,
          offset: Offset(7,5),
          color: Colors.black26,
        ),],*/
            ),
        child: Center(
          child: makeDesign(),
        ));
  }

  makeDesign() {
    return Container(
      height: shirtContainerSize,
      width: shirtContainerSize,
      child: Stack(
        children: [
          shirtContainer(),
          makeLines(0),
          makeLines(pi),
          makeLines(pi / 2),
          makeLines(pi * 2),
        ],
      ),
    );
  }

  shirtContainer() {
    double minOp = .05;
    double maxOp = .1;

    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            colors: [
              Rnd.color().withOpacity(Rnd.getDouble(minOp, maxOp)),
              Rnd.color().withOpacity(Rnd.getDouble(minOp, maxOp)),
              Rnd.color().withOpacity(Rnd.getDouble(minOp, maxOp)),
              Rnd.color().withOpacity(Rnd.getDouble(minOp, maxOp)),
              Rnd.color().withOpacity(Rnd.getDouble(minOp, maxOp)),
              Rnd.color().withOpacity(Rnd.getDouble(minOp, maxOp)),
            ],
            stops: [
              0.1,
              0.2,
              0.4,
              0.6,
              .8,
              1,
            ],
            center: Alignment.center,
          ).createShader(bounds);
        },
        blendMode: BlendMode.src,
        child: Container(
          height: shirtContainerSize,
          width: shirtContainerSize,
          decoration: BoxDecoration(
            color: Rnd.color().withOpacity(.25),
          ),
        ),
      ),
    );
  }
}

class Rnd {
  static Random _random = new Random();

  static RandomColor randomColor = RandomColor();
  Color random = randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.lowSaturation);

  static Color color() {
    return randomColor.randomColor(
        colorBrightness: ColorBrightness.light,
        colorSaturation: ColorSaturation.lowSaturation);
  }

  static int next(int min, int max) => min + _random.nextInt(max - min);

  static double nextDouble(int min, int max) =>
      min + _random.nextInt(max - min).toDouble();

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
    final double line3 = LineHelper.next(150, 275).toDouble();
    final double line4 = LineHelper.next(15, 100).toDouble();

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
