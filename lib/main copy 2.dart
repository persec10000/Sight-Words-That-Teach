import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'dart:async';
import 'package:desktop_window/desktop_window.dart';
// import 'package:window_size/window_size.dart' as window_size;
//import 'Home.dart';
import 'card_game.dart';
import 'bubble/bubbles.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();


  // fetchGif(AssetImage("assets/gif/motion-I.gif")).then((value) {
  //   debugPrint("fetchGif done: motion-I");
  //   fetchGif(AssetImage("assets/gif/motion-no.gif")).then((value)  {
  //     debugPrint("fetchGif done: motion-no");
  //     fetchGif(AssetImage("assets/gif/motion-sheheme.gif")).then((value) {
  //       debugPrint("fetchGif done: motion-sheheme");
  //       fetchGif(AssetImage("assets/gif/motion-all.gif")).then((value) {
  //         debugPrint("fetchGif done: motion-all");
  //       });
  //     });      
  //   });
  // });

  // fetchGif(AssetImage("assets/gif/motion-the.gif")).then((value) {
  //   debugPrint("fetchGif done: motion-the");
  //   fetchGif(AssetImage("assets/gif/motion-red.gif")).then((value){
  //     debugPrint("fetchGif done: motion-red");
  //     fetchGif(AssetImage("assets/gif/motion-little.gif")).then((value) {
  //       debugPrint("fetchGif done: motion-little");
  //       fetchGif(AssetImage("assets/gif/motion-away.gif")).then((value){
  //         debugPrint("fetchGif done: motion-away");
  //       });
  //     });
  //   });
  // });

  // fetchGif(AssetImage("assets/gif/motion-big.gif")).then((value) {
  //   debugPrint("fetchGif done: motion-big");
  //   fetchGif(AssetImage("assets/gif/motion-can.gif")).then((value) {
  //       debugPrint("fetchGif done: motion-can");
  //     fetchGif(AssetImage("assets/gif/motion-old.gif")).then((value) {
  //       debugPrint("fetchGif done: motion-old");
  //       fetchGif(AssetImage("assets/gif/motion-here.gif")).then((value)  {
  //         debugPrint("fetchGif done: motion-here");
          

    

  //       });
  //     }); 
  //    });



  // });
  
  //   fetchGif(AssetImage("assets/gif/motion-my.gif")).then((value){
  //     debugPrint("fetchGif done: motion-my");
  //     fetchGif(AssetImage("assets/gif/motion-we.gif")).then((value)  {
  //       debugPrint("fetchGif done: motion-we");
  //       fetchGif(AssetImage("assets/gif/motion-one.gif")).then((value) {
  //         debugPrint("fetchGif done: motion-one");
  //         fetchGif(AssetImage("assets/gif/motion-look.gif")).then((value)  {
  //           debugPrint("fetchGif done: motion-look");
  //         });        
  //       });
  //     });
  //   });

  


  if (Platform.isAndroid)
  {

  } 
  if (Platform.isIOS)
  {

  }
  if((Platform.isMacOS) || (Platform.isWindows))
  {
    await DesktopWindow.setWindowSize(Size(600, 1000));
    // var window = await window_size.getWindowInfo();
    // if (window.screen != null) {
    //   final screenFrame = window.screen.visibleFrame;
    //   final width = 671.0;
    //   final height = 1233.0;
    //   final left = ((screenFrame.width - width) / 2).roundToDouble();
    //   final top = ((screenFrame.height - height) / 3).roundToDouble();
    //   final frame = Rect.fromLTWH(left, top, width, height);
    //   window_size.setWindowFrame(frame);
    //   window_size.setWindowMinSize(Size(1.0 * width, 1.0 * height));
    //   window_size.setWindowMaxSize(Size(1.0 * width, 1.0 * height));
    // }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Sight Words',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  // VideoDemoState createState() => VideoDemoState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();


        
    // fetchGif(AssetImage("assets/gif/motion-I.gif"));
    // fetchGif(AssetImage("assets/gif/motion-my.gif"));
    // fetchGif(AssetImage("assets/gif/motion-no.gif"));
    // fetchGif(AssetImage("assets/gif/motion-red.gif"));
    // fetchGif(AssetImage("assets/gif/motion-can.gif"));
    // fetchGif(AssetImage("assets/gif/motion-old.gif"));
    // fetchGif(AssetImage("assets/gif/motion-little.gif"));
    // fetchGif(AssetImage("assets/gif/motion-big.gif"));
    // fetchGif(AssetImage("assets/gif/motion-here.gif"));
    // fetchGif(AssetImage("assets/gif/motion-look.gif"));
    // fetchGif(AssetImage("assets/gif/motion-away.gif"));
    // fetchGif(AssetImage("assets/gif/motion-we.gif"));
    // fetchGif(AssetImage("assets/gif/motion-sheheme.gif"));
    // fetchGif(AssetImage("assets/gif/motion-all.gif"));
    // fetchGif(AssetImage("assets/gif/motion-one.gif"));
    // fetchGif(AssetImage("assets/gif/motion-the.gif"));

    // create this only once
    //_audioCache = AudioCache(prefix: "sound/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }
  playWord()  {
    // AssetsAudioPlayer.newPlayer().open(
    //     Audio("assets/sound/word_sound/word_all.mp3"),
    //     //autoPlay: true,
    //     showNotification: false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/image/blue_back.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
                
          child: ListView(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Image.asset(
                'assets/image/logo.jpg',
                height: 200.0,
                width: 1200.0,
              ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headline4,
              // ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => CardGamePage(), fullscreenDialog: true));
                  // Navigator.push(context, 
                  // MaterialPageRoute(builder: (context) => BubbleGame()));
                },
                padding: EdgeInsets.only(left:50),//.all(0.0),
                child: Image.asset('assets/image/btn_0_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => Bubbles(), fullscreenDialog: true));//CardGame
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_1_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 17,),fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_17_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 16,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_16_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 15,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_15_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 14,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_14_.png')
              ),              
              // IconButton(
              //   icon: Image.asset('assets/image/btn_12_.png'),
              //   iconSize: 150,
              //   onPressed: (){
              //   },
              // ),                    
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid:13), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_13_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 12,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_12_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 11,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_11_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 10,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_10_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 9,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_9_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 8,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_8_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 7,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_7_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 6,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_6_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 5,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_5_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 4,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_4_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid: 3,), fullscreenDialog: true));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_3_.png')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => StoryPage(storyid:2), fullscreenDialog: true));
                  // MaterialPageRoute(builder: (context) => StoryAnimate(storyid: 16,)));
                },
                padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/image/btn_2_.png')
              ),
                            
            ],
          ),
        
      ),
      
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.

      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class BubbleGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bubble Game"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          // child: Text('Go back!'),
          child: Image.asset('assets/image/btn_back_normal.png'),
        ),
      ),
    );
  }
}


class CardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Game"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          // child: Text('Go back!'),
          child: Image.asset('assets/image/btn_back_normal.png'),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  StoryPage({Key key, this.storyid}) : super(key: key);
  final int storyid;  

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with SingleTickerProviderStateMixin{

  GifController controller;
  final asAPlayer = AssetsAudioPlayer();
  String strvoice;
  String strgif;
  AssetImage imgStory;
  // List<int> listGifDuration = [0,0,22,26,31,27,30,29,29,23,29,24,25,27,33,33,29,29];
  List<int> listGifDuration = [0,0,22,26,31,27,30,29,29,23,29,24,25,27,33,33,29,29];
  List<int> listGifDurationDs = [0,0,1,0,0,0,0,0,0,0,0,0,0,0,5,2,5,0];
  List<double> listGifFrames = [0,0,315,389,310,294,435,423,425,331,425,360,365,395,309,384,426,435];
  List<String> listAniFirst=[
    "",
    "",
"assets/ani_jpg/motion-I.jpg",
"assets/ani_jpg/motion-my.jpg",
"assets/ani_jpg/motion-no.jpg",
"assets/ani_jpg/motion-red.jpg",
"assets/ani_jpg/motion-can.jpg",
"assets/ani_jpg/motion-old.jpg",
"assets/ani_jpg/motion-little.jpg",
"assets/ani_jpg/motion-big.jpg",
"assets/ani_jpg/motion-here.jpg",
"assets/ani_jpg/motion-look.jpg",
"assets/ani_jpg/motion-away.jpg",
"assets/ani_jpg/motion-we.jpg",
"assets/ani_jpg/motion-sheheme.jpg",
"assets/ani_jpg/motion-all.jpg",
"assets/ani_jpg/motion-one.jpg",
"assets/ani_jpg/motion-the.jpg",
  ];
  GifImage imgStoryView;
  int nLoaded=0;
  @override
  void initState() {
    nLoaded = 0;
    super.initState();
    var arrvoice=new List(18);
    arrvoice[2] = "assets/sound/sound_I.mp3";
    arrvoice[3] = "assets/sound/sound_my.mp3";
    arrvoice[4] = "assets/sound/sound_no.mp3";
    arrvoice[5] = "assets/sound/sound_red.mp3";
    arrvoice[6] = "assets/sound/sound_can.mp3";
    arrvoice[7] = "assets/sound/sound_old.mp3";
    arrvoice[8] = "assets/sound/sound_little.mp3";
    arrvoice[9] = "assets/sound/sound_big.mp3";
    arrvoice[10] = "assets/sound/sound_here.mp3";
    arrvoice[11] = "assets/sound/sound_look.mp3";
    arrvoice[12] = "assets/sound/sound_away.mp3";
    arrvoice[13] = "assets/sound/sound_we.mp3";
    arrvoice[14] = "assets/sound/sound_sheheme.mp3";
    arrvoice[15] = "assets/sound/sound_all.mp3";
    arrvoice[16] = "assets/sound/sound_one.mp3";
    arrvoice[17] = "assets/sound/sound_the.mp3";
    strvoice = arrvoice[widget.storyid];
    



    var arrgif=new List(18);
    arrgif[2] = "assets/gif/motion-I.gif";
    arrgif[3] = "assets/gif/motion-my.gif";
    arrgif[4] = "assets/gif/motion-no.gif";
    arrgif[5] = "assets/gif/motion-red.gif";
    arrgif[6] = "assets/gif/motion-can.gif";
    arrgif[7] = "assets/gif/motion-old.gif";
    arrgif[8] = "assets/gif/motion-little.gif";
    arrgif[9] = "assets/gif/motion-big.gif";
    arrgif[10] = "assets/gif/motion-here.gif";
    arrgif[11] = "assets/gif/motion-look.gif";
    arrgif[12] = "assets/gif/motion-away.gif";
    arrgif[13] = "assets/gif/motion-we.gif";
    arrgif[14] = "assets/gif/motion-sheheme.gif";
    arrgif[15] = "assets/gif/motion-all.gif";
    arrgif[16] = "assets/gif/motion-one.gif";
    arrgif[17] = "assets/gif/motion-the.gif";
    strgif = arrgif[widget.storyid];
    // fetchGif(AssetImage(strgif)).then((value)  {
    //   nLoaded = 1;
        
      // controller= GifController(vsync: this,duration: Duration(seconds: listGifDuration[widget.storyid]));
      // controller.addListener(() => setState(() {}));
      // TickerFuture tickerFuture = controller.repeat(min:0,max:listGifFrames[widget.storyid],period:Duration(seconds: listGifDuration[widget.storyid]));
      // tickerFuture.timeout(Duration(seconds: listGifDuration[widget.storyid]), onTimeout:  () {
      //   controller.forward(from: 0);
      //   controller.stop(canceled: true);
      // });
    //   //controller.reset();
      
    //   // imgStoryView = GifImage(
    //   //               controller: controller,
    //   //               image: imgStory,
    //   //           );

      if(Platform.isWindows){
        debugPrint("$strvoice");
      }else{
        asAPlayer.open(Audio(strvoice) );
      }    

    //   controller.value = 0;
    //   controller.animateTo(listGifFrames[widget.storyid]);
      
    // });
    

    // imgStory = AssetImage(strgif);    
    Timer.periodic(Duration(seconds: listGifDuration[widget.storyid]+5 ), (Timer t)  {
      // 1 ~ listGifDurationDs[widget.storyid]
        nLoaded = 2;
        t.cancel();
        setState(() {});
    });

  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(nLoaded == 1)
    {
    return Scaffold(

      body: Container(
                
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // imgStoryView,
              GifImage(
                  controller: controller,
                  image:  AssetImage(strgif),
              ),
              // FlatButton(
              //   onPressed: (){            },
              //   padding: EdgeInsets.only(left:50),//.all(0.0),
              //   child: Image(image: imgStory,gaplessPlayback: false)
              // ),

              // FlatButton(
              //   onPressed: (){
              //     controller.reset();
              //     controller.animateTo(listGifFrames[widget.storyid]);
                  
              //   },
              //   padding: EdgeInsets.only(left:50),//.all(0.0),
              //   child: Image.asset('assets/image/btn_0_.png')
              // ),

              FloatingActionButton(
                child: Icon(Icons.home_rounded),
                onPressed: () {
                  if(Platform.isWindows){
                    debugPrint("stop audio $strvoice");
                  }else{
                    asAPlayer.stop();
                  }    
                  controller.reset();
                  controller.stop();     
                  controller.dispose(); 
                  // this.dispose();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.deepOrange,
              ),
                            
            ],
          ),
        
      ),
      
    );
  
    }else if(nLoaded==0){

    return Scaffold(

      body: Container(
                
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              FlatButton(
                onPressed: (){
                },
                // padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                // child: AssetImage(strgif),
                child: new Image.asset(strgif),
                // child: new Image.asset(listAniFirst[widget.storyid]), 
              ),

              // FlatButton(
              //   child: Icon(Icons.home_rounded),
              //   onPressed: () {
              //     nLoaded = 2;
              //     setState(() {});
              //   },
              // ),

              // FloatingActionButton(
              //   child: Icon(Icons.home_rounded),
              //   onPressed: () {
              //     if(Platform.isWindows){
              //       debugPrint("stop audio $strvoice");
              //     }else{
              //       asAPlayer.stop();
              //     }    
                  
              //     // controller.reset();
              //     // controller.stop();                  
              //     Navigator.pop(context);
              //   },
              //   backgroundColor: Colors.deepOrange,
              // ),
                                         
            ],
          ),
        
      ),
      
    );
  
    }else if(nLoaded==2){
    return Scaffold(

      body: Container(
                
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              FlatButton(
                onPressed: (){
                },
                // padding: EdgeInsets.only(left:50),//padding: EdgeInsets.all(0.0),
                // child: AssetImage(strgif),
                // child: new Image.asset(strgif),
                child: new Image.asset(listAniFirst[widget.storyid]), 
              ),

              // FlatButton(
              //   child: Icon(Icons.home_rounded),
              //   onPressed: () {
              //     nLoaded = 0;
              //     setState(() {});
              //   },
              // ),

              FloatingActionButton(
                child: Icon(Icons.home_rounded),
                onPressed: () {
                  if(Platform.isWindows){
                    debugPrint("stop audio $strvoice");
                  }else{
                    asAPlayer.stop();
                  }    
                  
                  // controller.reset();
                  // controller.stop();                  
                  Navigator.pop(context);
                },
                backgroundColor: Colors.deepOrange,
              ),
                                         
            ],
          ),
        
      ),
      
    );
        
    }

  }



}


class StoryAnimate extends StatelessWidget {
  StoryAnimate({Key key, this.storyid}) : super(key: key);
  final int storyid;
  final asAPlayer = AssetsAudioPlayer();
  

  @override
  Widget build(BuildContext context) {
    String strvoice;
    var arrvoice=new List(18);
    arrvoice[2] = "assets/sound/sound_I.mp3";
    arrvoice[3] = "assets/sound/sound_my.mp3";
    arrvoice[4] = "assets/sound/sound_no.mp3";
    arrvoice[5] = "assets/sound/sound_red.mp3";
    arrvoice[6] = "assets/sound/sound_can.mp3";
    arrvoice[7] = "assets/sound/sound_old.mp3";
    arrvoice[8] = "assets/sound/sound_little.mp3";
    arrvoice[9] = "assets/sound/sound_big.mp3";
    arrvoice[10] = "assets/sound/sound_here.mp3";
    arrvoice[11] = "assets/sound/sound_look.mp3";
    arrvoice[12] = "assets/sound/sound_away.mp3";
    arrvoice[13] = "assets/sound/sound_we.mp3";
    arrvoice[14] = "assets/sound/sound_sheheme.mp3";
    arrvoice[15] = "assets/sound/sound_all.mp3";
    arrvoice[16] = "assets/sound/sound_one.mp3";
    arrvoice[17] = "assets/sound/sound_the.mp3";
    strvoice = arrvoice[storyid];
    Image img = new Image(image: new AssetImage("assets/splash.gif"),gaplessPlayback: true);
    if(Platform.isWindows){
      debugPrint("$strvoice");
    }else{
      asAPlayer.open(Audio(strvoice) );
    }    
    
    String strgif;
    var arrgif=new List(18);
    arrgif[2] = "assets/gif/motion-I.gif";
    arrgif[3] = "assets/gif/motion-my.gif";
    arrgif[4] = "assets/gif/motion-no.gif";
    arrgif[5] = "assets/gif/motion-red.gif";
    arrgif[6] = "assets/gif/motion-can.gif";
    arrgif[7] = "assets/gif/motion-old.gif";
    arrgif[8] = "assets/gif/motion-little.gif";
    arrgif[9] = "assets/gif/motion-big.gif";
    arrgif[10] = "assets/gif/motion-here.gif";
    arrgif[11] = "assets/gif/motion-look.gif";
    arrgif[12] = "assets/gif/motion-away.gif";
    arrgif[13] = "assets/gif/motion-we.gif";
    arrgif[14] = "assets/gif/motion-sheheme.gif";
    arrgif[15] = "assets/gif/motion-all.gif";
    arrgif[16] = "assets/gif/motion-one.gif";
    arrgif[17] = "assets/gif/motion-the.gif";
    strgif = arrgif[storyid];
    
    img = new Image(image: new AssetImage(strgif),gaplessPlayback: false);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Story Animated"),
      // ),
      body: Center(
        child:Column(
          children: <Widget>[
            FlatButton(
                onPressed: (){
                },
                padding: EdgeInsets.all(0.0),
                child: img
              ),

            FloatingActionButton(
              // child: Image.asset('assets/image/btn_back_normal.png'),
              child: Icon(Icons.home_rounded),
              onPressed: () {
                if(Platform.isWindows){
                  debugPrint("stop audio $strvoice");
                }else{
                  asAPlayer.stop();
                }    
                
                Navigator.pop(context);
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => Setting()));
              },
              backgroundColor: Colors.deepOrange,
            ),
          ]
          
        )

      ),
    );
  }


}


class VideoDemoState extends State<MyHomePage> {

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //  _controller = VideoPlayerController.network(
    //      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _controller = VideoPlayerController.asset("assets/video/motion_all.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Video Demo"),
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child:
          Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),

        
      ),
    );
  }
}


// First screen --- Splash Screen Page
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return MyHomePage(title: 'Sight Words Teach');
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      body: Center(
        child: new Image(image: new AssetImage("assets/splash.gif"))
        // child: Image.asset(
        //   "assets/10.png",
        //   width: 200.0,
        //   height: 100.0,
        // ),
      ),
    );
  }
}