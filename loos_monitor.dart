import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_students/main.dart';
import 'package:the_students/play_monitor2.dart';
import 'package:the_students/pre_end_monitor.dart';


class Loosmonitor extends StatefulWidget {
  Loosmonitor({Key? key}) : super(key: key);

  @override
  _LoosmonitorState createState() => _LoosmonitorState();
}

class _LoosmonitorState extends State<Loosmonitor> {
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
          child: Image.asset("assets/images/loos.jpg", fit: BoxFit.none),
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
                children:<Widget>[
                  Icon(
                    Icons.monetization_on,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
                  ),
                  Text('0',
                      style: TextStyle(fontSize: 35)),

                  Icon(
                    Icons.timer,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
                  ),
                  Text('0',
                      style: TextStyle(fontSize: 35)),

                  Icon(
                    Icons.mood,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
                  ),
                  Text('0',
                      style: TextStyle(fontSize: 35)),
                  Icon(
                    Icons.explicit,
                    size: 40.0,
                    semanticLabel: 'Текст для показа в режиме доступности',
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
                  height: 100),
                Text("Вы проиграли!",style: TextStyle(fontSize: 30,color: Colors.white),),
                SizedBox(
                    width:MediaQuery.of(context).size.width,
                    height: 50),
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
                      ),
                      child: const Text("Вернуться в меню", textAlign: TextAlign.center,style: TextStyle(fontSize: 35),),
                      onPressed:() {
                        Navigator.push(context, PageTransition(child: HomePage(), type: PageTransitionType.fade));
                        }
                    )
                )
              ]
          ),
        ),
      ],
    );
  }
}

