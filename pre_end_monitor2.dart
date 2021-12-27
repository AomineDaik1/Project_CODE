import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_students/hive_work.dart';
import 'package:the_students/loos_monitor.dart';
import 'package:the_students/win_monitor.dart';
import 'package:the_students/play_monitor4.dart';




class Preend2 extends StatefulWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  Preend2(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  @override
  _Preend2State createState() => _Preend2State(money_answer,time_answer,mood_answer,exp_answer,questvar);
}

class _Preend2State extends State<Preend2> {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  _Preend2State(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  String  greeting= "";




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
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.6,
          child: Image.asset("assets/images/back1.jpg", fit: BoxFit.none),
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

                  Icon(
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
          decoration: BoxDecoration(
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
                  height: 20,
                ),
                Text("В процессе работы, перед вами возникают технические трудности...",style: TextStyle(fontSize: 24,color: Colors.white),),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 20,
                ),
                Container(
                    width: 400 ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                        overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      child: Text("Попросить коллег по работе помочь вам.", textAlign: TextAlign.center),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Вы спрашиваете у коллег помощи, но проект оказывается слишком сложным даже для них. Вы не справляетесь с проектом и вас увольняют……",
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
                      },
                    )
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 20,
                ),
                Container(
                    width: 400 ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                        overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      child: Text("Попросить помочь знакомого Сашу, который является опытным разработчиком за условную сумму..", textAlign: TextAlign.center),
                      onPressed:() {
                        Navigator.push(context, PageTransition(child: Playing4(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                      },
                    )
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 20,
                ),
                Container(
                    width: 400 ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                        overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      child: Text("Попытаться справиться самим.", textAlign: TextAlign.center),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Проект оказывается слишком сложным для вас, и вы не справляетесь с ним… После чего вас увольняют.",
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
                      },
                    )
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 20,
                ),
                Container(
                    width: 400 ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                        overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      child: Text("Посмотреть в интернете.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Вам не удаётся найти решение в интернете, и вы не справляетесь с проектом… После чего вас увольняют.",
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