import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class JuneButtons {
  static Widget primaryButton({
    required VoidCallback onPressed,
    required String text,
    bool? isFirst,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFFC7BAA9).withOpacity(0.15),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isFirst == true ? 150 : 0,
            ),
            child: Text(
              translate(text).toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 42,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Shadow(
                    offset: Offset(-3, -3),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Shadow(
                    offset: Offset(3, -3),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget secondaryButton({
    required VoidCallback onPressed,
    required String text,
    bool? isTitle,
    Widget? child,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        size: Size(double.infinity, 100),
        painter: CustomBorderPainter(),
        child: ClipPath(
          clipper: CustomButtonClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0XFFc7e6fe), Color(0XFFc7bbfe)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: Stack(
              children: [
                Positioned(
                  bottom: 4,
                  right: 20,
                  child: Image.asset(
                    "assets/images/ornament_button.png",
                    height: 75,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTitle == true ? 100 : 0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Text(
                        isTitle == true
                            ? translate(text).toUpperCase()
                            : translate(text),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTitle == true ? 36 : 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.moveTo(50, 0);
    path.lineTo(w - 50, 0);
    path.quadraticBezierTo(w, h * 0.25, w, h / 2);
    path.quadraticBezierTo(w, h * 0.75, w - 50, h);
    path.lineTo(50, h);
    path.quadraticBezierTo(0, h * 0.75, 0, h / 2);
    path.quadraticBezierTo(0, h * 0.25, 50, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Path borderPath = CustomButtonClipper().getClip(size);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
