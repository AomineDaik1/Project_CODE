import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/pre_end_monitor.dart';
import 'package:the_students/loos_monitor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_students/hive_work.dart';
import 'package:the_students/play_monitor3.dart';


class Playing2 extends StatefulWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  Playing2(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  @override
  _Playing2State createState() => _Playing2State(money_answer,time_answer,mood_answer,exp_answer,questvar);
}

class _Playing2State extends State<Playing2> {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  _Playing2State(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);
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
          child: Image.asset("assets/images/windows.jpg", fit: BoxFit.none),
        ),
        Positioned(top:MediaQuery.of(context).size.height*0.52  ,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.08,
              decoration:BoxDecoration(
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
                Text('Вы закончили с продуктом для портфолио и идете на собеседование всей командой.',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 23),),
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
                      child: Text("[Обычная компания] Вы представляете свой продукт, проходите собеседование. Работодатель приглашает вас на работу. Вы соглашаетесь с предложением и устраиваетесь.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        money_answer+=200;
                        money_summ(200);
                        time_answer-=300;
                        time_sub(300);
                        exp_answer+=200;
                        exp_summ(200);
                        print('$mood_answer $time_answer $exp_answer $money_answer');
                        questvar.add(1);
                        Navigator.push(context, PageTransition(child: Playing3(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
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
                      child: Text("[Известная компания] На собеседовании вам говорят, что из всей команды сможете устроиться только вы. Вы соглашаетесь и работаете в команде работодателя.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        mood_answer-=350;
                        mood_sub(350);
                        time_answer-=400;
                        time_sub(400);
                        exp_answer+=300;
                        exp_summ(300);
                        money_answer+=2000;
                        money_summ(2000);
                        print('$mood_answer $time_answer $exp_answer $money_answer');
                        questvar.add(2);
                        if(questvar[0]==3){
                          loos_count();
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Поражение",
                            desc: "Вы потратили уйму времени, при отборе хорошей команды, исключили пару друзей из команды и после этого вы променяли ее на работу в известной компании в одиночку. Вам становится не по себе, и работа не приносит ничего кроме негатива….",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Окей",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.push(context, PageTransition(child: Loosmonitor(), type: PageTransitionType.fade)),
                                width: 120,
                              )
                            ],
                          ).show();
                        }else {
                          Navigator.push(context, PageTransition(child: Preend1(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                        }
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
                      child: Text("[Обычная компания] – вариант развития требует 200 опыта. Представляя свой продукт работадателю, вы замечаете, что он удивлен вашими навыками.Работадатель приглашает вас на работу и вы соглашаетесь.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                      onPressed:() {
                        if(exp_answer<200){

                        }else {
                          mood_answer += 100;
                          mood_summ(100);
                          time_answer -= 100;
                          time_sub(100);
                          exp_answer += 250;
                          exp_summ(250);
                          money_answer+=600;
                          money_summ(600);
                          print('$mood_answer $time_answer $exp_answer $money_answer');
                          questvar.add(3);
                          Navigator.push(context, PageTransition(child: Playing3(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
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
