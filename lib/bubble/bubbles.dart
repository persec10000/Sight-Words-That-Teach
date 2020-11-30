import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';
import 'bubble.dart';
import 'model_logic.dart';
import 'setting.dart';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:io';
import 'package:sightwords/app_global.dart';

class Bubbles extends StatefulWidget {
  final double bubbleCount;
  final double maxBubbleSize;
  final double speed;
  final Color color;
  final double canvasWidth;
  final double canvasHeight;
  final String animation;
  final String gesture;


  Bubbles(
      {this.bubbleCount,
      this.maxBubbleSize,
      this.speed,
      this.color,
      this.canvasWidth,
      this.canvasHeight,
      this.animation,
      this.gesture});
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

class _BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  List<Bubble> listOfBubbles;
  Offset offset = Offset(0, 0);
  List<Color> color = [
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.amber,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.blueAccent,
    Colors.brown,
    Colors.green,
    Colors.indigo
  ];
  List<ui.Image> arrimg = new List<ui.Image>(16);
  ui.Image bgBubbleCanvas;
  ui.Image img1;
  int isImageloaded = 0;
  bool isWubbleGen = false;

  List<int> listWordIdQuiz = new List<int>(16);
  int nCurWordId=0;
  List<String> arrvoice = [
  "assets/sound/word_sound/word_all.mp3",
  "assets/sound/word_sound/word_away.mp3",
  "assets/sound/word_sound/word_big.mp3",
  "assets/sound/word_sound/word_can.mp3",
  "assets/sound/word_sound/word_here.mp3",
  "assets/sound/word_sound/word_I.mp3",
  "assets/sound/word_sound/word_little.mp3",
  "assets/sound/word_sound/word_look.mp3",
  "assets/sound/word_sound/word_my.mp3",
  "assets/sound/word_sound/word_no.mp3",
  "assets/sound/word_sound/word_old.mp3",
  "assets/sound/word_sound/word_one.mp3",
  "assets/sound/word_sound/word_red.mp3",
  "assets/sound/word_sound/word_sheheme.mp3",
  "assets/sound/word_sound/word_the.mp3",
  "assets/sound/word_sound/word_we.mp3",
  ];


  int getClickedBubble(Offset pos)
  {
    int ret = -1;
    for ( Bubble bubble in listOfBubbles )
    {
      //debugPrint("Bubble pos:${bubble.bubbleid} : ${bubble.x} ${bubble.y}");
            
      double diffx = pos.dx - bubble.x;
      double diffy = pos.dy - bubble.y;
      double dist = sqrt(diffx * diffx + diffy * diffy);

      double r = bubble.image.height * 1.0;
      if (dist < r) {
        diffx = diffx * r / dist;
        diffy = diffy * r / dist;

        debugPrint("Clicked Bubble ID: ${bubble.bubbleid} : " + arrvoice[bubble.bubbleid]);
        ret = bubble.bubbleid;
        if (ret == listWordIdQuiz[nCurWordId])
          break;
      }
    }
    return ret;
  }
  
  Widget _buildImage() {
    if (this.isImageloaded==16) {
      if(this.isWubbleGen==false)
      {
        isWubbleGen = true;
        initWubbles();
      }

      return Scaffold(
        body: GestureDetector(
          onPanDown: (DragDownDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
                  object.globalToLocal(details.globalPosition);

              int nSuccessId=-1;
              debugPrint("Click pos: ${_localPosition.dx} ${_localPosition.dy}");
              int nClicked = getClickedBubble(_localPosition);
              if(nClicked >= 0)
              {
                debugPrint("Clicked Item:"+arrvoice[ nClicked ]);
                
                if (nClicked == listWordIdQuiz[nCurWordId].toInt()){
                  nSuccessId = nClicked;
                  soundPopBubble();
                } else{
                  soundCurWord();
                }
              }

              listOfBubbles.forEach((bubble) {
                //debugPrint("Bubble pos:${bubble.bubbleid} : ${bubble.x} ${bubble.y}");
                if((bubble.bubbleid == nClicked) && (nSuccessId>=0)){
                  if (bubble.x>0)
                  {// b/c 3~4 times of Gesture Detected for 1 click.

                    if(nCurWordId>=15)
                    {
                      Timer.periodic(Duration(seconds: 2 ), (Timer t)  {
                          nCurWordId++;
                          t.cancel();
                          setState(() {});
                      });        
                    } else{
                      nCurWordId++;
                      soundCurWord();                    
                    }

                    // nCurWordId++;
                    // if(nCurWordId>=16)
                    // {
                    //   // The End
                    // }else{
                    //   soundCurWord();
                    // }
                    
                  }
                  bubble.onDraw(_localPosition, bubble, context,"Eraser");
                } else{
                  
                  bubble.onDraw(_localPosition, bubble, context,"Default");
                }
                
                // bubble.onDraw(_localPosition, bubble, context,
                //     widget.gesture == null ? "Eraser" : widget.gesture);
              });
              offset = _localPosition;
            });
          },
          //onPanEnd: (DragEndDetails details) => offset = Offset(0, 0),
          child: CustomPaint(
              
              painter: BubblePainter(
                  bubbles: listOfBubbles, 
                  controller: animationController,
                  bgBubbleGame: bgBubbleCanvas,
                  ),
              size: Size(
                widget.canvasWidth == null
                    ? MediaQuery.of(context).size.width-50
                    : widget.canvasWidth-50,
                widget.canvasHeight == null
                    ? MediaQuery.of(context).size.height-50
                    : widget.canvasHeight-50,
              )),
        ),
        // FlatButton(
        //   onPressed: (){
        //     Navigator.push(context, 
        //     MaterialPageRoute(builder: (context) => Bubbles()));//CardGame
        //   },
        //   padding: EdgeInsets.all(0.0),
        //   child: Image.asset('assets/image/btn_1_.png')
        // ),
        floatingActionButton: FloatingActionButton(
          // child: Image.asset('assets/image/btn_back_normal.png'),
          child: Icon(Icons.home_rounded),//keyboard_arrow_left
          onPressed: () {
            nCurWordId = 0;
            Navigator.pop(context);
            
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => Setting()));
          },
          backgroundColor: Colors.deepOrange,
        ),
      );
    } else{
      return new Center(child: new Text(' '));//"loading"
    }
  }

  @override
  void initState() {
    super.initState();
    init();

  }

  void initWubbles(){ // init Word Bubbles
    listOfBubbles = List();
    int i = 0;//widget.bubbleCount == null ? 200 : widget.bubbleCount;
    i=0;
    while (i < 16) {
      listOfBubbles.add(Bubble(
          widget.color == null ? color[Random().nextInt(10)] : widget.color,
          16,// widget.maxBubbleSize == null ? 20 : widget.maxBubbleSize,
          widget.speed == null ? 1.2 : widget.speed,
          arrimg[i],
          i));
      i=i+1;
    }
    animationController = new AnimationController(
        duration: const Duration(minutes: 1000), vsync: this);
    animationController.addListener(() {
      changeBubblePosition();
    });
    animationController.forward();

    soundCurWord();
  }
  
  void soundCurWord()
  {
    String strVoice;
    strVoice = arrvoice[ listWordIdQuiz[nCurWordId] ];
    if(AppGlobals.isPlayingSoundNow)
    {
      return;
    }
    if(AppGlobals.isWin){
      debugPrint("$strVoice");
    }else{
      AppGlobals.isPlayingSoundNow = true;
      Timer.periodic(Duration(seconds: 2 ), (Timer t)  {
        t.cancel();
        AppGlobals.isPlayingSoundNow = false;
        AssetsAudioPlayer.playAndForget(Audio(strVoice));                    
                      }); 
      
    } 
  }

  void soundPopBubble()
  {
    String strVoice;
    strVoice = "assets/sound/pop_bubble.mp3";
    if(AppGlobals.isWin){
      debugPrint("$strVoice");
    }else{
      AssetsAudioPlayer.playAndForget(Audio(strVoice));
    } 
  }

  Future <Null> init() async {
    final ByteData data = await rootBundle.load("assets/image/bubble_back.jpg");
    bgBubbleCanvas = await loadImageBg(new Uint8List.view(data.buffer));

    nCurWordId = 0;
    //// init quiz array
    var random = new Random();
    // Go through all elements.
    for(int j=0;j<listWordIdQuiz.length;j++)
    {
      listWordIdQuiz[j] = j;
    }
    for (int i = 0; i < listWordIdQuiz.length ; i++) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(listWordIdQuiz.length-1);
      
      var temp = listWordIdQuiz[i];
      listWordIdQuiz[i] = listWordIdQuiz[n];
      listWordIdQuiz[n] = temp;
    }

    // init images
    List<String> strArr = [
      'assets/image/word_all.png', 
      'assets/image/word_away.png',
      'assets/image/word_big.png', 
      'assets/image/word_can.png',
      'assets/image/word_here.png', 
      'assets/image/word_I.png',
      'assets/image/word_little.png', 
      'assets/image/word_look.png',
      'assets/image/word_my.png',
      'assets/image/word_no.png',
      'assets/image/word_old.png',
      'assets/image/word_one.png',
      'assets/image/word_red.png',
      'assets/image/word_sheheme.png',
      'assets/image/word_the.png',
      'assets/image/word_we.png',
      ];



    for (int i = 0 ; i< 16;i=i+1)
    {
      final ByteData data = await rootBundle.load(strArr[i]);
      arrimg[i] = await loadImage(new Uint8List.view(data.buffer));
    }


    
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded += 1;        
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<ui.Image> loadImageBg(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    if(nCurWordId>=16)
    {
      return new Scaffold(
        body: new Container(
          child: ListView(
          children: <Widget>[

            new Image.asset(
              'assets/image/lbl_great.png',
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
            ),
            new Image.asset(
              'assets/image/smile_bubble.png',
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
            ),                     
            
            new FloatingActionButton(
              // child: Image.asset('assets/image/btn_back_normal.png'),
              child: Icon(Icons.home_rounded),//keyboard_arrow_left
              onPressed: () {
                nCurWordId = 0;
                Navigator.pop(context);
                
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => Setting()));
              },
              backgroundColor: Colors.deepOrange,
            ),
                                 
          ],
        ),
        )
      );

    }else{
      return new Scaffold(
        body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bubble_back.png"),
            fit: BoxFit.cover,
          ),
        ),          
          child: _buildImage(),
        )
      );

    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void changeBubblePosition() {
    void eachprocess(bubble)
    {
      bubble.changeThePosition(widget.animation == null ? "Default" : widget.animation);

    }
    listOfBubbles.forEach((bubble) => eachprocess(bubble) );
    setState(() {});
  }
}


