import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'card_game.dart';
import 'card_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'app_global.dart';

class CardBoard extends StatefulWidget {
  final Function() onWin;
  final BuildContext context;
   
  //const CardBoard({Key key, this.onWin}) : super(key: key);
  CardBoard({Key key, this.onWin, this.context}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    return CardBoardState();
  }
}

class CardBoardState extends State<CardBoard> {
  List<int> openedCards = [];
  List<CardModel> cards;
  int a;
  int score = 0;
  int time = 0;

  @override
  void initState() {
    super.initState();
    a=1;
    cards = createCards();
  }


  List<CardModel> createCards() {
    List<String> asset = [];
    List(15).forEach((f) => asset.add('0${(asset.length + 1)}.png'));
    List(15).forEach((f) => asset.add('0${(asset.length - 15 + 1)}.png'));
    return List(30).map((f) {
      int index = Random().nextInt(1000) % asset.length;
      String _image =
          'assets/' + asset[index].substring(asset[index].length - 6);
      asset.removeAt(index);
      return CardModel(
          id: 30 - asset.length - 1, image: _image, key: UniqueKey(),imgid:index);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - kToolbarHeight - 24 - 120;
    if(a>=16)
    {
      return Center(
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
          ],
        ),
      );

    }else{
      return GridView.count(
          padding: EdgeInsets.zero,
          //  physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 5,
          childAspectRatio: width / height,
          children: cards
              .map((f) =>
              CardItem(key: f.key, model: f, onFlipCard: handleFlipCard))
              .toList());      
    }
  }

  void soundFlipCard()
  {
    String strVoice;
    strVoice = "assets/sound/card_flip.mp3";
    if(AppGlobals.isWin){
      debugPrint("$strVoice");
    }else{
      AssetsAudioPlayer.playAndForget(Audio(strVoice));
    } 
  }

  void handleFlipCard(bool isOpened, int id) {
    cards[id].isNeedCloseEffect = false;

    soundFlipCard();
    

    if (isOpened) {
      setCardOpened(id);
      openedCards.add(id);
    } else {
      setCardNone(id);
      openedCards.remove(id);
    }

    checkWin();
    
    checkOpenedCard(isOpened);
    
    checkOver();
  }

  void checkOver(){

    if(a >= 26){//16
      a=1;
      BuildContext context = widget.context;
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Congratulations!"),
            content: Text("You WIN !"),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  cards = createCards();
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => CardGamePage(score: 0, time: 0)));
                  
                },
                child: Text("Play Again"),
              ),
            ],
          );
        }
      );
      

      
    }
  }

  // void resetTimer(){
  //   Timer(Duration(seconds: 1), (){
  //     setState(() {
  //             this.time+=1;
  //             resetTimer();
  //           });
  //   });
  // }

  void checkOpenedCard(bool isOpened) {
    if (openedCards.length == 2 && isOpened) {
      cards[openedCards[0]].isNeedCloseEffect = true;
      setCardNone(openedCards[0]);
      cards[openedCards[1]].isNeedCloseEffect = true;
      setCardNone(openedCards[1]);
      openedCards.clear();
    }
  }

  void checkWin() {
    if (openedCards.length == 2) {
      if (cards[openedCards[0]].image == cards[openedCards[1]].image) {
        setCardWin(openedCards[0]);
        setCardWin(openedCards[1]);
        debugPrint("OK:: ${cards[openedCards[0]].image} ${cards[openedCards[1]].image} -${cards[openedCards[0]].imgid}  ${cards[openedCards[1]].imgid}");

        String strVoice;        
        if (cards[openedCards[0]].image=="assets/15.png")
        {
          strVoice="assets/sound/word_sound/word_we.mp3";
        }
        if (cards[openedCards[0]].image=="assets/14.png")
        {
          strVoice="assets/sound/word_sound/word_the.mp3";
        }
        if (cards[openedCards[0]].image=="assets/13.png")
        {
          strVoice="assets/sound/word_sound/word_sheheme.mp3";
        }
        if (cards[openedCards[0]].image=="assets/12.png")
        {
          strVoice="assets/sound/word_sound/word_red.mp3";
        }
        if (cards[openedCards[0]].image=="assets/11.png")
        {
          strVoice="assets/sound/word_sound/word_one.mp3";
        }
        if (cards[openedCards[0]].image=="assets/10.png")
        {
          strVoice="assets/sound/word_sound/word_old.mp3";
        }
        if (cards[openedCards[0]].image=="assets/09.png")
        {
          strVoice="assets/sound/word_sound/word_no.mp3";
        }
        if (cards[openedCards[0]].image=="assets/08.png")
        {
          strVoice="assets/sound/word_sound/word_my.mp3";
        }
        if (cards[openedCards[0]].image=="assets/07.png")
        {
          strVoice="assets/sound/word_sound/word_look.mp3";
        }
        if (cards[openedCards[0]].image=="assets/06.png")
        {
          strVoice="assets/sound/word_sound/word_little.mp3";
        }
        if (cards[openedCards[0]].image=="assets/05.png")
        {
          strVoice="assets/sound/word_sound/word_here.mp3";
        }
        if (cards[openedCards[0]].image=="assets/04.png")
        {
          strVoice="assets/sound/word_sound/word_can.mp3";
        }
        if (cards[openedCards[0]].image=="assets/03.png")
        {
          strVoice="assets/sound/word_sound/word_big.mp3";
        }
        if (cards[openedCards[0]].image=="assets/02.png")
        {
          strVoice="assets/sound/word_sound/word_away.mp3";
        }
        if (cards[openedCards[0]].image=="assets/01.png")
        {
          strVoice="assets/sound/word_sound/word_all.mp3";
        }
        if(AppGlobals.isWin){
          debugPrint("$strVoice");
        }else{
          AssetsAudioPlayer.playAndForget(Audio(strVoice));
        }         

        openedCards.clear();
        if(a>=15)
        {
          Timer.periodic(Duration(seconds: 3 ), (Timer t)  {
              a++;
              widget.onWin();
              setState(() {});
          });        
        } else{
          a++;
          widget.onWin();
        }
        
      }
    }
  }

  void setCardNone(int id) {
    setState(() {
      cards[id].status = ECardStatus.None;
      cards[id].key = UniqueKey();
    });
  }

  void setCardOpened(int id) {
    setState(() {
      cards[id].status = ECardStatus.Opened;
      cards[id].key = UniqueKey();
    });
  }

  void setCardWin(int id) {
    setState(() {
      cards[id].status = ECardStatus.Win;
      cards[id].key = UniqueKey();
    });
  }
}