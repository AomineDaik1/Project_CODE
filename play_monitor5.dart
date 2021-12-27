import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/win_monitor.dart';
import 'package:the_students/hive_work.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_students/loos_monitor.dart';

class Playing5 extends StatefulWidget {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  Playing5(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);

  @override
  _Playing5State createState() => _Playing5State(money_answer,time_answer,mood_answer,exp_answer,questvar);
}

class _Playing5State extends State<Playing5> {
  var mood_answer;

  var money_answer;

  var exp_answer;

  var time_answer;

  List<int> questvar;

  _Playing5State(this.money_answer,this.time_answer,this.mood_answer,this.exp_answer,this.questvar);





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
                Text('Вы подготовили свой проект для конкурса стартапов. Ваш опыт работы сыграл большую роль, и вы уверены в своей победе. Осталось представить проект судьям. ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
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
                      child: Text("Подготовить презентацию, отдохнуть перед выступлением и набраться сил.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                      onPressed:() {
                        loos_count();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Поражение",
                          desc: "Из-за уверенности в проекте вы не репетируете доклад и судьи не смогли понять полностью потенциал проекта. Вы занимаете третье место на конкурсе.",
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
                      child: Text("Подготовить презентацию, написать доклад и отрепетировать с командой.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                      onPressed:() {
                        win_count();
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Победа",
                          desc: "Хорошая подготовка и отличный проект привел вас к победе на конкурсе стартапов! Вы получаете приз за первое место и открываете свою студию по разработке игр.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Окей",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.push(context, PageTransition(child: Winmonitor(), type: PageTransitionType.fade)),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    )
                ),
              ]
          ),
        ),
      ],
    );
  }
}