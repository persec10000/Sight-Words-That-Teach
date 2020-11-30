import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'card_board.dart';
import 'card_item.dart';

class CardGamePage extends StatefulWidget {
  final score;
  final time;
    CardGamePage({Key key, this.score, this.time}): super(key:key);
  CardGamePageState createState() => new CardGamePageState();
}

class CardGamePageState extends State<CardGamePage> {
  int score = 0;
  int time = 0;
  int init = 0;


  @override
  void initState() {
    super.initState();
    init = 1;
    // Timer(Duration(seconds: 2), runTimer);

    
  }


  void showalert(BuildContext context){
   showDialog(
     context: context,
     builder: (context){ 
      return AlertDialog(
          title: Text('Welcome to Card Flipper',
        style: TextStyle(
          fontSize: 28.0,
          fontFamily: 'GoogleSans',
          color: Colors.black,
        ),
        ),
        content: Text('Match two cards to score points. 1 pair match = 200 points',
         style: TextStyle(
           fontSize: 22.0,
           fontFamily: 'GoogleSans',
           color: Colors.grey,
         ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
              Timer(Duration(seconds: 0), runTimer);
            },
            child: Text(" Let's play !",
           style: TextStyle(
             fontSize: 20.0,
             fontFamily: 'GoogleSans',
             color: Colors.purple, 
           ),
          ),
          )
        ],
     );
     }
   );
  }
  
  void runTimer() {
    
    Timer(Duration(
      seconds: 1
      ), () {
      setState(() {
        if(this.score == 2000){
          this.time = -2;
          this.score = 0;
        }
        this.time += 1;
        runTimer();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if(init == 1){
    //   init++;
    // Future.delayed(Duration.zero, ()=> showalert(context));
    // }
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          
          // decoration: BoxDecoration(
            
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //   Colors.black87,
              //   Colors.black87,
              //   Colors.orange,
              //   Colors.black87,
              //   Colors.black87
              // ])),
               
              // ),
          child: Column(
            children: <Widget>[
              initGameBoard(context),
              FloatingActionButton(
                // child: Image.asset('assets/image/btn_back_normal.png'),
                child: Icon(Icons.home_rounded),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //     context, MaterialPageRoute(builder: (context) => Setting()));
                },
                backgroundColor: Colors.deepOrange,
              ),              

              // SizedBox(height: 24.0),
              initializeGameScore(),              
            ],
          ),
        ),
        );
  }


  Widget initializeGameScore(){
    return buildScore();
    

  }

  Widget initGameBoard(BuildContext bcContext){
    return buildBoard(bcContext);
  }

  Widget buildScore() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Text(time.toString() + "s",
          //     style: TextStyle(
          //         fontSize: 32.0,
          //         color: Colors.black,
          //         fontFamily: 'GoogleSans')),
             
          // Text('Score: '+score.toString(),
          //     style: TextStyle(
          //         fontSize: 32.0,
          //         color: Colors.black,
          //         fontFamily: 'GoogleSans'),
          //         )
        ],
      ),
    );
  }

  Widget buildBoard(BuildContext bcontext) {
    return Flexible(
        child: Stack(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0), child: CardBoard(onWin: onWin, context: bcontext,)),
        
        // buildGradientView()
      ],
       
    ),
    
    );
  }

  Widget buildGradientView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 32.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black, Colors.transparent])),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 32.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black, Colors.black])),
        )
      ],
    );
  }

  void onWin() {
    
    setState(() { 
      if(this.score == 2000){
        this.time = -2;
      }
      this.score += 200;}
    );
  
  }
}
