import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/play_monitor.dart';
import 'package:the_students/hive_work.dart';
void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Загадочки на логику',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children:[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/back1.jpg", fit: BoxFit.cover),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:const  <Widget>[
                  BattonBox(),
                  InfoBox(),
                  StaticBatton(),
                ],
            )
          ],

        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 75,
      child: (FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                child: Container(
                  height: 400.0,
                  width: 360.0,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Правила/Rules",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(padding: EdgeInsets.only(left: 15),
                      child: Column(
                        children:const  [
                          Text("У игрока есть 4 ресурса, каждый из которых понадобится ему для прохождения игры.",style: TextStyle(fontSize: 18),),
                          SizedBox(height: 10),
                          Text("В ходе принятия решений, игрок может, как получать ресурсы, так и тратить. Игроку нужно оценивать сложившуюся ситуацию и предугадывать  возможное развитие событий. ",style: TextStyle(fontSize: 18),),
                          SizedBox(height: 10),
                          Text("Авторы игры старались сделать события более логичными,для комфортного прохождения .",style: TextStyle(fontSize: 18),)
                        ],
                      ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text("Правила",style: TextStyle(fontSize:  30, fontWeight: FontWeight.w400),),
        icon: Icon(Icons.info,size: 40,),
      )
      ),
    );
  }
}

class BattonBox extends StatelessWidget {
  const BattonBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 75,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: (FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                child: Container(
                  height:470.0,
                  width: 360.0,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Правила/Rules",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(padding: EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Text("Вы студент, окончивший ТУСУР. Теперь вам предстоит встретиться с новыми трудностями, в частности трудоустройство. В рамках игры у вас есть 4 ресурса ( МОНЕТЫ / ВРЕМЯ / ОПЫТ/МОРАЛЬ ), которыми необходимо тщательно распоряжаться.",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 10),
                            Text("Чем больше суммарное значение ресурсов в конце игры, тем успешнее финальная оценка системного мышления. ",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 10),
                            Text("Подсказка: при большем количестве очков ОПЫТА, вы сможете выбирать больше вариантов событий.",style: TextStyle(fontSize: 18),),
                        SizedBox(height:20),
                        FloatingActionButton.extended(onPressed: (){Navigator.push(context, PageTransition(child: Playing(), type: PageTransitionType.fade));}, label: Text("Продолжить"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text("Начать",style: TextStyle(fontSize:  30, fontWeight: FontWeight.w400),),
      )
      ),
    );
  }
}


class StaticBatton extends StatelessWidget {
  const StaticBatton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 75,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: (FloatingActionButton.extended(
        onPressed: () async {
          final win_count =await get_win();
          final loos_count =await  get_loos();
          final summ_mood =await get_mood();
          final sub_mood = await get_mood_s();
          final summ_money = await get_money();
          final sub_money =await get_money_s();
          final summ_exp = await get_exp();
          final sub_exp = await get_exp_s();
          final summ_time =await  get_time();
          final sub_time = await get_time_s();
          Navigator.push(context,
              PageTransition(child: StaticBox(win_count,loos_count,summ_mood,sub_mood,summ_money,sub_money,summ_exp,sub_exp,summ_time ,sub_time), type: PageTransitionType.fade));
        },
        label: Text("Твоя статистика"),
        extendedTextStyle:
        ((TextStyle(fontSize: 25, fontWeight: FontWeight.w400))),
      )),
    );
  }
}




class StaticBox extends StatelessWidget{
  final win_count;
  final loos_count;
  final summ_mood;
  final sub_mood ;
  final summ_money ;
  final sub_money;
  final summ_exp;
  final sub_exp;
  final summ_time;
  final sub_time;
  StaticBox(this.win_count,this.loos_count,this.summ_mood,this.sub_mood,this.summ_money,this.sub_money,this.summ_exp, this.sub_exp,this.summ_time, this.sub_time);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
            child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/images/back_2.jpg", fit: BoxFit.cover),
              ),
              Row(

                children:[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.2,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child:Center(
                          child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    const Icon(
                                      Icons.check_circle_outline,
                                      size: 40.0,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                        height: 10
                                    ),
                                    Text('Победы:',style: TextStyle(fontSize: 30),),
                                    SizedBox(
                                        height: 10
                                    ),
                                    Text('$win_count',style: TextStyle(fontSize: 30,color: Colors.green),)
                                 ],
                              ),
                        )
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.15,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child:
                        Column(
                          children: [
                            SizedBox(
                                height: 15
                            ),
                            const Icon(
                              Icons.monetization_on,
                              size: 40.0,
                              color: Colors.green,
                            ),
                            SizedBox(
                                height: 10
                            ),
                            Text('Получено монет:',style: TextStyle(fontSize: 15),),
                            SizedBox(
                                height: 10
                            ),
                            Text('$summ_money',style: TextStyle(fontSize: 30,color: Colors.green),)
                          ],
                        )
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.explicit,
                                size: 40.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Получено опыта:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$summ_exp',style: TextStyle(fontSize: 30,color: Colors.green),)
                            ],

                          )

                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.mood,
                                size: 40.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Получено морали:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$summ_mood',style: TextStyle(fontSize: 30,color: Colors.green),)
                            ],
                          )
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.timer,
                                size: 40.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Получено времени:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$summ_time',style: TextStyle(fontSize: 30,color: Colors.green),)
                            ],
                          )
                      ),
                    ],
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.2,
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.2,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:Center(
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                const Icon(
                                  Icons.do_not_disturb_on,
                                  size: 40.0,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                    height: 10
                                ),
                                Text('Поражения:',style: TextStyle(fontSize: 26),),
                                SizedBox(
                                    height: 10
                                ),
                                Text('$loos_count',style: TextStyle(fontSize: 30,color: Colors.red),)
                              ],
                            ),
                          )
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.monetization_on_outlined,
                                size: 40.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Потрачено монет:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$sub_money',style: TextStyle(fontSize: 30,color: Colors.red),)
                            ],
                          )
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.explicit,
                                size: 40.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Потрачено опыта:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$sub_exp',style: TextStyle(fontSize: 30,color: Colors.red),)
                            ],

                          )

                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.mood_bad,
                                size: 40.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Потрачено морали:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$sub_mood',style: TextStyle(fontSize: 30,color: Colors.red),)
                            ],
                          )
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.02
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child:
                          Column(
                            children: [
                              SizedBox(
                                  height: 15
                              ),
                              const Icon(
                                Icons.timer,
                                size: 40.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                  height: 10
                              ),
                              Text('Потрачено времени:',style: TextStyle(fontSize: 15),),
                              SizedBox(
                                  height: 10
                              ),
                              Text('$sub_time',style: TextStyle(fontSize: 30,color: Colors.red),)
                            ],
                          )
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        )
    );
  }
}



