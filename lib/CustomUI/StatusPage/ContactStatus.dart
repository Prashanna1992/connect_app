import 'dart:math';

import 'package:flutter/material.dart';

class ContactStatus extends StatelessWidget {
  const ContactStatus(
      {Key? key,
      required this.name,
      required this.updatedAt,
      this.image,
      required this.statusCount,
      required this.isSeen})
      : super(key: key);
  final String name;
  final String updatedAt;
  final String? image;
  final int statusCount;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isSeen: isSeen, statusCount: statusCount),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: image != null
              ? AssetImage(image!)
              : const AssetImage("assets/nopic.png"),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        updatedAt,
        style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}

double degreeToAngle(double degree) {
  return degree * pi / 180.0;
}

class StatusPainter extends CustomPainter {
  bool isSeen;
  int statusCount;
  StatusPainter({required this.isSeen, required this.statusCount});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..color = isSeen ? Colors.grey : Colors.pink
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    int i = 1;
    double arc = 360.0 / statusCount;
    double degree = 90;
    while (i <= statusCount) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(degree + 3), degreeToAngle(arc - 8), false, paint);
      degree += arc;
      i++;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
