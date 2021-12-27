import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/hive_work.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_students/loos_monitor.dart';
import 'package:the_students/play_monitor5.dart';



class Playing4 extends StatefulWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  Playing4(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  @override
  _Playing4State createState() => _Playing4State(money_answer,time_answer,mood_answer,exp_answer,questvar);
}

class _Playing4State extends State<Playing4> {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  _Playing4State(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);





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
                Text('Ваша команда успешно справляется с проектом, но такая работа им не по душе.Один из членов команды предлагает представить ваш собственный проект на конкурсе стартапов. ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 15,
                ),
                Container(
                    width: 400 ,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                          overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                      ),
                      child: Text("Сосредоточиться на работе", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Вы утопаете в работе, друзья не согласны с вашим выбором и они вынуждены пойти без вас на конкурс стартапов.",
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
                  height: 30,
                ),
                Container(
                    width: 400 ,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child:  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 32,74, 1)),
                          overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                      ),
                      child: Text("Сосредоточиться на проекте для конкурса", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                      onPressed:() {
                          questvar.add(2);
                          Navigator.push(context, PageTransition(child: Playing5(money_answer,time_answer,mood_answer,exp_answer,questvar), type: PageTransitionType.fade));
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