import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/hive_work.dart';
import 'package:the_students/play_monitor2.dart';

class Playing extends StatefulWidget {
  Playing({Key? key}) : super(key: key);

  @override
  _PlayingState createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              picture_res(),
              batton_box(),
            ],
        ),

    );
  }
}


class picture_res extends StatelessWidget {
  const picture_res({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.6,
          child: Image.asset("assets/images/Job.jpg", fit: BoxFit.none),
        ),
        Positioned(top:MediaQuery.of(context).size.height*0.52  ,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.08,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:const <Widget>[
                Icon(
                  Icons.monetization_on,
                  size: 40.0,
                  semanticLabel: 'Текст для показа в режиме доступности',
                ),
                Text('1000',
                    style: TextStyle(fontSize: 35)),

                Icon(
                  Icons.timer,
                  size: 40.0,
                ),
                Text('800',
                    style: TextStyle(fontSize: 35)),

                Icon(
                  Icons.mood,
                  size: 40.0,
                ),
                Text('500',
                    style: TextStyle(fontSize: 35)),
                Icon(
                  Icons.explicit,
                  size: 40.0,
                ),
                Text('0',
                    style: TextStyle(fontSize: 35)),

              ],
            ),
          )
        )
      ],
    );
  }
}

class batton_box extends StatelessWidget {
  const batton_box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.4,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromRGBO(32, 40,73, 1), Color.fromRGBO(39, 48,77, 1)])
          ),
        ),
        Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: <Widget>[
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: 30,
            ),
            Container(
              width: 400 ,
              height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60))
              ),
              child:  ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                  overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                ),
                child: const Text("Нанять знакомого Сашу, который является опытным разработчиком, чтобы перенять его опыт. Распределить роли, сделать продукт для портфолио.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                onPressed:() {
                  var money_answer= 1000,time_answer = 800, mood_answer= 500, exp_answer = 0;
                  money_answer-=700;
                  money_sub(700);
                  time_answer+=50;
                  time_summ(50);
                  exp_answer=200;
                  exp_summ(200);
                  List<int> questvar =[1];
                  Navigator.push(context, PageTransition(child: Playing2(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                },
              )
          ),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: 30,
            ),
            Container(
                width: 400 ,
                height: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60))
                ),
                child:  ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                    overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                  ),
                  child: const Text("Обсудить с командой дальнейшие планы, распределить роли, сделать продукт для портфолио.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                  onPressed:() {
                    var money_answer= 1000,time_answer = 800, mood_answer= 500, exp_answer = 0;
                    time_answer-=200;
                    time_sub(200);
                    exp_answer+=100;
                    exp_summ(100);
                    print('$mood_answer $time_answer $exp_answer $money_answer');
                    List<int> questvar =[2];
                    Navigator.push(context, PageTransition(child: Playing2(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                  },
                )
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: 30,
            ),
            Container(
                width: 400 ,
                height: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60))
                ),
                child:  ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                    overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                  ),
                  child: const Text("Исключить менее эффективных людей из команды и найти более эффективных, распределить роли, сделать продукт для портфолио.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                  onPressed:() {
                    var money_answer= 1000,time_answer = 800, mood_answer= 500, exp_answer = 0;
                    mood_answer-=200;
                    mood_sub(200);
                    time_answer-=250;
                    time_sub(250);
                    exp_answer+=150;
                    exp_summ(150);
                    List<int> questvar =[3];
                    Navigator.push(context, PageTransition(child: Playing2(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                  },
                )
            ),
          ]
        ),
        ),
      ],
    );
  }
}



