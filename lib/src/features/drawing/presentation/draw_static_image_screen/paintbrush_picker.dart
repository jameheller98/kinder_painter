import 'package:flutter/material.dart';
import 'package:master_source_flutter/src/constants/svg_paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart'
    as paint_brush;

import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/paintbrush.dart';

class PaintbrushPicker extends StatelessWidget {
  const PaintbrushPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: 98,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(10, 0),
            child: Container(
              width: 58,
              color: Colors.amber.shade50,
            ),
          ),
          SizedBox(
            child: Wrap(
              runSpacing: 25,
              children: [
                Paintbrush(
                  stringSvg: (Color? color) => getSvgPaintbrush(
                    paint_brush.TypePaintbrush.crayon,
                    color,
                  ),
                  type: paint_brush.TypePaintbrush.crayon,
                ),
                Paintbrush(
                  stringSvg: (Color? color) => getSvgPaintbrush(
                    paint_brush.TypePaintbrush.pencil,
                    color,
                  ),
                  type: paint_brush.TypePaintbrush.pencil,
                ),
                Paintbrush(
                  stringSvg: (Color? color) => getSvgPaintbrush(
                    paint_brush.TypePaintbrush.paintBrush,
                    color,
                  ),
                  type: paint_brush.TypePaintbrush.paintBrush,
                ),
                Paintbrush(
                  stringSvg: (Color? color) => getSvgPaintbrush(
                    paint_brush.TypePaintbrush.waterPen,
                    color,
                  ),
                  type: paint_brush.TypePaintbrush.waterPen,
                ),
                Paintbrush(
                  stringSvg: (Color? color) => getSvgPaintbrush(
                    paint_brush.TypePaintbrush.waterPaint,
                    color,
                  ),
                  type: paint_brush.TypePaintbrush.waterPaint,
                ),
                Paintbrush(
                  stringSvg: (Color? color) => getSvgPaintbrush(
                    paint_brush.TypePaintbrush.eraser,
                    color,
                  ),
                  type: paint_brush.TypePaintbrush.eraser,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
