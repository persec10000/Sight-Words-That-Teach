import 'package:flutter/material.dart';
import 'model_logic.dart';
import 'dart:ui' as ui show Image;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BubblePainter extends CustomPainter  {
  List<Bubble> bubbles;
  Offset offset;
  AnimationController controller;
  ui.Image bgBubbleGame;
  int nLoadedBg = 0;
  BubblePainter({
    this.bubbles,
    this.controller,
    this.bgBubbleGame,
  });


  @override
  void paint(Canvas canvas, Size canvasSize) {
    // if(bgBubbleGame != null)
    {

      Paint paint = new Paint();
      // paint.color = Color.fromARGB(0, 0, 0, 0);
      canvas.drawImage(bgBubbleGame, Offset.zero, paint);
      // canvas.drawPaint(Paint(Color.fromARGB(0, 0, 0, 0)));
    }
      
    
    bubbles.forEach((bubble) {
      bubble.draw(canvas, canvasSize);
      
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
