import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cpWidth = 500;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Custom Paint Example"),
      ),
      body: CustomPaint(
        size: Size(cpWidth, (cpWidth * 0.540084388185654).toDouble()),
        painter: RPSCustomPainter(),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * -0.007218781);
    path_0.cubicTo(0, size.height * 0.4046875, size.width * 0.06540084, size.height * 0.6997031,
        size.width * 0.3080169, size.height * 0.8902578);
    path_0.cubicTo(size.width * 0.5506329, size.height * 1.080812, size.width * 0.7850422,
        size.height * 0.9069297, size.width * 1.020194, size.height * 1.006617);
    path_0.cubicTo(size.width * 1.255346, size.height * 1.106305, size.width * 1.255346,
        size.height * 1.748508, size.width * 1.476793, size.height * 2.143719);
    path_0.cubicTo(size.width * 1.698241, size.height * 2.538930, size.width * 2.165156,
        size.height * 2.634922, size.width * 2.544810, size.height * 2.233969);
    path_0.cubicTo(size.width * 2.924451, size.height * 1.833016, size.width * 3.096557,
        size.height * 0.8968438, size.width * 2.983122, size.height * 0.3448516);
    path_0.cubicTo(size.width * 2.869684, size.height * -0.2071484, size.width * 2.652291,
        size.height * -0.7109375, size.width * 1.603376, size.height * -0.7109375);
    path_0.cubicTo(size.width * 0.5544599, size.height * -0.7109375, 0, size.height * -0.4191172, 0,
        size.height * -0.007218781);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff4B3F6B).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
