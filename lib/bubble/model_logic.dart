// import 'dart:html';
import 'dart:math';
import 'dart:io' show Platform;
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;
  String animation;
  String gesture;
  ui.Image image;
  int bubbleid;
  int hiddenMe;
  Bubble(Color colour, double maxBubbleSize, double speed, ui.Image img, int bid) {
    // this.colour = colour.withOpacity(Random().nextDouble());
    this.colour = colour.withOpacity(1);
    this.direction = Random().nextDouble() * 360;
    this.speed = 0.7+Random().nextDouble();
    this.radius = maxBubbleSize;//Random().nextDouble() * maxBubbleSize;
    this.animation = animation;
    this.gesture = gesture;
    this.image = img;
    this.bubbleid = bid;
    this.hiddenMe = 0;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    defineOffsetCoordinateInitially(canvasSize);

    shiftTheOreintationIfCanvasBorderReached(canvasSize);

    // canvas.drawCircle(Offset(x, y), radius, paint);
    // canvas.drawImage(image, new Offset(x-radius, y-radius), paint);
    if (this.hiddenMe==1)
    {
      //debugPrint("hidden bubble ${this.bubbleid}");
    }else{
      // canvas.drawCircle(Offset(x, y), image.width/2, paint);
      canvas.drawImage(image, new Offset(x-image.width/2, y-image.height/2), paint);
    }
    // canvas.drawImage(image, offset, paint)
  }

  void defineOffsetCoordinateInitially(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }
//add the bubble animation here
  changeThePosition(String animation) {
    switch (animation) {
      case "Default":
        {
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / sin(speed)
              : x = x - speed * sin(direction) / sin(speed);
          direction > 90 && direction < 270
          // direction > 180 && direction <= 360
              ? y += speed * sin(direction) / sin(speed)
              : y -= speed * sin(direction) / sin(speed);          
        }
        break;
      case "WallBreaker":
        {
          var angle = 180 - (direction + 90);
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / sin(speed) * pi
              : x = x - speed * sin(direction) / sin(speed) * pi;
          direction > 90 && direction < 270
              ? y += speed * sin(angle) / sin(speed)
              : y -= speed * sin(angle) / sin(speed);
        }
        break;
      case "OnWeed":
        {
          var angle = 180 - (direction + 90);
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / (sin(speed) * pi)
              : x = x - speed * sin(direction) / (sin(speed) * pi);
          direction > 90 && direction < 270
              ? y += speed * sin(angle) / (sin(speed) * pi)
              : y -= speed * sin(angle) / (sin(speed) * pi);
        }
        break;
      case "Goodnbad":
        {
          var angle = 180 - (direction + 90);
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / (sin(speed) * pi)
              : x = x - speed * sin(direction) / (sin(speed) * pi);
          direction > 90 && direction < 270
              ? y += direction * sin(angle) / (sin(speed) * pi)
              : y -= speed * sin(angle) / (sin(speed) * pi);
        }
        break;
      case "Battle":
        {
          var angle = 180 - (direction + 90);
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / (sin(speed) * pi)
              : x = x - speed * sin(direction) / (sin(speed) * pi);
          direction > 90 && direction < 270
              ? y += direction * sin(angle) / (sin(speed) * pi)
              : y -= direction * sin(angle) / (sin(speed) * pi);
        }
        break;
      case "Rain":
        {
          //travelling wave : surface problem
          var angle = 180 - (direction + 90);
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / (sin(speed) * pi)
              : x = x - speed * sin(direction) / (sin(speed) * pi);
          direction > 90 && direction < 270
              ? y += speed * sin(angle) / sin(speed)
              : y -= speed * sin(angle) / sin(speed);
        }
        break;
      default:
        {
          direction > 0 && direction < 180
              ? x = x + speed * sin(direction) / sin(speed)
              : x = x - speed * sin(direction) / sin(speed);
          direction > 90 && direction < 270
              ? y += speed * sin(direction) / sin(speed)
              : y -= speed * sin(direction) / sin(speed);
        }
        break;
    }
  }
//add the  gesture here
  onDraw(Offset _localPosition, Bubble bubble, BuildContext context,
      String gesture) {
    switch (gesture) {
      case "Default":
        {
          double diffx = _localPosition.dx - bubble.x;
          double diffy = _localPosition.dy - bubble.y;
          double dist = sqrt(diffx * diffx + diffy * diffy);

          if (dist < 60) {
            diffx = diffx * 60 / dist;
            diffy = diffy * 60 / dist;
            bubble.x = diffx + _localPosition.dx;
            bubble.y = diffy + _localPosition.dy;
          }
        }
        break;
      case "CenterBlast":
        {

          double diffx = _localPosition.dx - bubble.x;
          double diffy = _localPosition.dy - bubble.y;
          double dist = sqrt(diffx * diffx + diffy * diffy);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          if (dist < 60) {
            bubble.x = width / 2;
            bubble.y = height / 2;
          }
        }
        break;
      case "Dart":
        {
          double diffx = _localPosition.dx - bubble.x;
          double diffy = _localPosition.dy - bubble.y;
          double dist = sqrt(diffx * diffx + diffy * diffy);

          if (dist < 60) {
            bubble.x = 0;
            bubble.y = 0;
          }
        }
        break;
      case "Attract":
        {
          double diffx = _localPosition.dx - bubble.x;
          double diffy = _localPosition.dy - bubble.y;
          double dist = sqrt(diffx * diffx + diffy * diffy);

          if (dist < 60) {
            bubble.x = _localPosition.dx;
            bubble.y = _localPosition.dy;
          }
        }
        break;
      case "Eraser":
        // debugPrint("Bubble id ${this.bubbleid} ");
        {
          double diffx = _localPosition.dx - bubble.x;
          double diffy = _localPosition.dy - bubble.y;
          double dist = sqrt(diffx * diffx + diffy * diffy);

          double r = this.image.height * 1.0;
          if (dist < r) {
            diffx = diffx * r / dist;
            diffy = diffy * r / dist;
            // bubble.x = -1000;// diffx;
            // bubble.y = -1000;// diffy;

            // debugPrint("Erase This ${this.bubbleid}");
            var arrvoice=new List(18);
            arrvoice[2] = "assets/sound/word_sound/word_all.mp3";
            arrvoice[3] = "assets/sound/word_sound/word_away.mp3";
            arrvoice[4] = "assets/sound/word_sound/word_big.mp3";
            arrvoice[5] = "assets/sound/word_sound/word_can.mp3";
            arrvoice[6] = "assets/sound/word_sound/word_here.mp3";
            arrvoice[7] = "assets/sound/word_sound/word_I.mp3";
            arrvoice[8] = "assets/sound/word_sound/word_little.mp3";
            arrvoice[9] = "assets/sound/word_sound/word_look.mp3";
            arrvoice[10] = "assets/sound/word_sound/word_my.mp3";
            arrvoice[11] = "assets/sound/word_sound/word_no.mp3";
            arrvoice[12] = "assets/sound/word_sound/word_old.mp3";
            arrvoice[13] = "assets/sound/word_sound/word_one.mp3";
            arrvoice[14] = "assets/sound/word_sound/word_red.mp3";
            arrvoice[15] = "assets/sound/word_sound/word_sheheme.mp3";
            arrvoice[16] = "assets/sound/word_sound/word_the.mp3";
            arrvoice[17] = "assets/sound/word_sound/word_we.mp3";

            String strvoice = arrvoice[this.bubbleid+2];
          }
        }

        // bubble.x = -1000;// diffx;
        // bubble.y = -1000;// diffy;
        this.hiddenMe = 1;
        bubble.speed = 0;
        break;
      default:
        {

          double diffx = _localPosition.dx - bubble.x;
          double diffy = _localPosition.dy - bubble.y;
          double dist = sqrt(diffx * diffx + diffy * diffy);

          if (dist < 60) {
            diffx = diffx * 60 / dist;
            diffy = diffy * 60 / dist;
            bubble.x = diffx + _localPosition.dx;
            bubble.y = diffy + _localPosition.dy;
          }
        }
        break;
    }
  }

  shiftTheOreintationIfCanvasBorderReached(Size canvasSize) {
    double dy = this.image.height*0.5;
    double dx = this.image.width*0.5;
    // if(x>=canvasSize.width)
    // {
    //   if(direction <= 90){
    //     direction += 270;
    //     direction = direction % 360;
    //   }        
    //   else if(direction <=270)
    //     direction 
    //   direction = direction % 360;
    // }
    bool dirUpdate = false;
    if (x >= canvasSize.width)
    {
      x = canvasSize.width;
      dirUpdate = true;
    }
    if(x <= dx )
    {
      x = dx;
      dirUpdate = true;
    }
    if(y<=dy)
    {
      y = dy;
      dirUpdate = true;
    }
    if(y>=canvasSize.height)
    {
      y = canvasSize.height;
      dirUpdate = true;
    }

    // if (x >= canvasSize.width-dx || x < dx || y >= canvasSize.height-dy || y < dy) 
    if(dirUpdate == true)
    {      
      direction = Random().nextDouble() * 360;
      // direction = direction + 90;
      // direction = direction % 360;
    }
  }
}
