import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/point.dart';

class CanvasUtils {
  static const int touchTolerance = 4;

  static List<Point> handleParseSvgToPoint(List<String> commands) {
    final List<Point> points = [];

    for (int i = 0; i < commands.length; i++) {
      final currentCommand = commands[i];
      final currentCommandString = currentCommand[0];
      final pointString =
          currentCommand.replaceFirst(currentCommandString, '').split(' ');

      switch (currentCommandString) {
        case 'M':
          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                double.parse(pointString.first),
                double.parse(pointString.last),
              ),
            ),
          );
        case 'L':
          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                double.parse(pointString.first),
                double.parse(pointString.last),
              ),
            ),
          );
        case 'H':
          final previousPoint = points[i - 1];

          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                double.parse(pointString.first),
                previousPoint.point!.dy,
              ),
            ),
          );
        case 'V':
          final previousPoint = points[i - 1];

          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                previousPoint.point!.dx,
                double.parse(pointString.first),
              ),
            ),
          );
        case 'C':
          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                double.parse(pointString[4]),
                double.parse(pointString[5]),
              ),
              controlPoint1: Offset(
                double.parse(pointString[0]),
                double.parse(pointString[1]),
              ),
              controlPoint2: Offset(
                double.parse(pointString[2]),
                double.parse(pointString[3]),
              ),
            ),
          );
        case 'S':
          final previousPoint = points[i - 1];

          if (previousPoint.command == 'S' || previousPoint.command == 'C') {
            final reflectionX =
                2 * previousPoint.point!.dx - previousPoint.controlPoint2!.dx;
            final reflectionY =
                2 * previousPoint.point!.dy - previousPoint.controlPoint2!.dy;

            points.add(
              Point(
                command: currentCommandString,
                point: Offset(
                  double.parse(pointString[2]),
                  double.parse(pointString[3]),
                ),
                controlPoint1: Offset(
                  reflectionX,
                  reflectionY,
                ),
                controlPoint2: Offset(
                  double.parse(pointString[0]),
                  double.parse(pointString[1]),
                ),
              ),
            );
          } else {
            final previousPoint = points[i - 1];

            points.add(
              Point(
                command: currentCommandString,
                point: Offset(
                  double.parse(pointString[2]),
                  double.parse(pointString[3]),
                ),
                controlPoint1: Offset(
                  previousPoint.point!.dx,
                  previousPoint.point!.dy,
                ),
                controlPoint2: Offset(
                  double.parse(pointString[0]),
                  double.parse(pointString[1]),
                ),
              ),
            );
          }
        case 'Q':
          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                double.parse(pointString[2]),
                double.parse(pointString[3]),
              ),
              controlPoint2: Offset(
                double.parse(pointString[0]),
                double.parse(pointString[1]),
              ),
            ),
          );
        case 'T':
          final previousPoint = points[i - 1];

          if (previousPoint.command == 'T' || previousPoint.command == 'Q') {
            final reflectionX =
                2 * previousPoint.point!.dx - previousPoint.controlPoint2!.dx;
            final reflectionY =
                2 * previousPoint.point!.dy - previousPoint.controlPoint2!.dy;

            points.add(
              Point(
                command: currentCommandString,
                point: Offset(
                  double.parse(pointString[0]),
                  double.parse(pointString[1]),
                ),
                controlPoint2: Offset(
                  reflectionX,
                  reflectionY,
                ),
              ),
            );
          } else {
            points.add(
              Point(
                command: currentCommandString,
                point: Offset(
                  double.parse(pointString[0]),
                  double.parse(pointString[1]),
                ),
                controlPoint2: Offset(
                  previousPoint.point!.dx,
                  previousPoint.point!.dy,
                ),
              ),
            );
          }
        case 'A':
          points.add(
            Point(
              command: currentCommandString,
              point: Offset(
                double.parse(pointString[5]),
                double.parse(pointString[6]),
              ),
              radius: Radius.elliptical(
                double.parse(pointString[0]),
                double.parse(pointString[1]),
              ),
              rotation: double.parse(pointString[2]),
              largeArc: pointString[3] == '1' ? true : false,
              clockwise: pointString[4] == '1' ? true : false,
            ),
          );
        case 'Z':
          points.add(
            Point(
              command: currentCommandString,
            ),
          );
        default:
      }
    }

    return points;
  }
}
