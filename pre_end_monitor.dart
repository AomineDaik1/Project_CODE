import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_students/hive_work.dart';
import 'package:the_students/loos_monitor.dart';
import 'package:the_students/play_monitor3.dart';





class Preend1 extends StatefulWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  Preend1(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  @override
  _Preend1State createState() => _Preend1State(money_answer,time_answer,mood_answer,exp_answer,questvar);
}

class _Preend1State extends State<Preend1> {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  _Preend1State(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);
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
          child: Image.asset("assets/images/Job.jpg", fit: BoxFit.fill),
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
                    semanticLabel: 'Текст для показа в режиме доступности',
                  ),
                  Text('$money_answer',
                      style: TextStyle(fontSize: 35)),

                  Icon(
                    Icons.timer,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
                  ),
                  Text('$time_answer',
                      style: TextStyle(fontSize: 35)),

                  Icon(
                    Icons.mood,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
                  ),
                  Text('$mood_answer',
                      style: TextStyle(fontSize: 35)),
                  Icon(
                    Icons.explicit,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
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
                Text("Вы проработали пол года...",style: TextStyle(fontSize: 30,color: Colors.white),),
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
                      child: Text("Продолжить работать.", textAlign: TextAlign.center),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Вы продолжаете думать о своей студенческой мечте… В скором времени вы эмоционально истощаетесь и увольняетесь",
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
                      child: Text("Вернуться к команде друзей", textAlign: TextAlign.center),
                      onPressed:() {
                          Navigator.push(context, PageTransition(child: Playing3(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
                          //Navigator.push(context, PageTransition(child: Pre_end1(), type: PageTransitionType.fade));
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
                      child: Text("Взять отпуск.", textAlign: TextAlign.center),
                      onPressed:() {
                        loos_count();
                       Alert(
                         context: context,
                         type: AlertType.error,
                         title: "Поражение",
                         desc: "Вы продолжаете думать о своей студенческой мечте… В скором времени вы эмоционально истощаетесь и увольняетесь",
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
                      child: Text("Уволиться и набрать новую опытную команду для дальнейшего проекта", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Вы набираете опытную команду, но проходит слишком много времени и вы решаете бросить эту затею…",
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
