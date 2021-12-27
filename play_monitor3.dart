import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/pre_end_monitor2.dart';
import 'package:the_students/win_monitor.dart';
import 'package:the_students/hive_work.dart';
import 'package:the_students/play_monitor4.dart';


class Playing3 extends StatefulWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  Playing3(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  @override
  _Playing3State createState() => _Playing3State(money_answer,time_answer,mood_answer,exp_answer,questvar);
}

class _Playing3State extends State<Playing3> {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  _Playing3State(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          picture_res(money_answer,time_answer,mood_answer,exp_answer,questvar),
          batton_box(money_answer,time_answer,mood_answer,exp_answer,questvar),
        ],
      ),

    );
  }
}


class picture_res extends StatelessWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  picture_res(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.6,
          child: Image.asset("assets/images/maxresdefault.jpg", fit: BoxFit.none),
        ),
        Positioned(top:MediaQuery.of(context).size.height*0.52  ,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.08,
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.monetization_on,
                    size: 40.0,
                  ),
                  Text('$money_answer',
                      style: TextStyle(fontSize: 35)),

                  Icon(
                    Icons.timer,
                    size: 40.0,
                  ),
                  Text('$time_answer',
                      style: TextStyle(fontSize: 35)),

                  const Icon(
                    Icons.mood,
                    size: 40.0,
                  ),
                  Text('$mood_answer',
                      style: TextStyle(fontSize: 35)),
                  Icon(
                    Icons.explicit,
                    size: 40.0,
                  ),
                  Text('$exp_answer',
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
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  batton_box(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

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
                  height: 15,
                ),
                Text('Наниматель предлагает вам  первый проект в новой компании: ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 23),),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 15,
                ),
                Container(
                    width: 400 ,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                          overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                      ),
                      child: Text("[Скучный,но перпспективный ] Вам предлагается работа с банковскими данными, обработка больший массивов информации, скучно но прибыльно.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        money_answer+=450;
                        money_summ(450);
                        exp_answer+=100;
                        exp_summ(100);
                        mood_answer-=100;
                        mood_sub(100);
                        print('$mood_answer $time_answer $exp_answer $money_answer');
                        questvar.add(1);
                        Navigator.push(context, PageTransition(child: Playing4(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                          overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                      ),
                      child: Text("[Стандартный проект]Ваша команда хорошо понимает, что ей предстоит делать. Работа несложная, однако прибыль соответствующая ", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        mood_answer+=50;
                        mood_summ(50);
                        exp_answer+=100;
                        exp_summ(100);
                        money_answer+=250;
                        money_summ(250);
                        print('$mood_answer $time_answer $exp_answer $money_answer');
                        questvar.add(2);
                        Navigator.push(context, PageTransition(child: Playing4(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                          overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                      ),
                      child: Text("[Сложный проект] Работадатель дает вам трудное техническое задание. Полного плана действий у вас пока  нет,несмотря на это вы верите в успех", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                      onPressed:() {
                        if(exp_answer<200){

                        }else {
                          mood_answer -= 50;
                          mood_sub(50);
                          exp_answer += 200;
                          exp_summ(200);
                          money_answer+=500;
                          money_summ(500);
                          print('$mood_answer $time_answer $exp_answer $money_answer');
                          questvar.add(3);
                          Navigator.push(context, PageTransition(child: Preend2(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                        }
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