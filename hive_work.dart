import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<int> get_mood() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  final dynamic  _summ=box.get('mood',defaultValue: 0) as int;
  box.close();
  return  Future.sync(() => _summ);
}

Future<Object> get_mood_s() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ = box.get('mood_s',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object> get_money() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('money',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object> get_money_s() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('money_s',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object> get_time() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('time',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object> get_time_s() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('time_s',defaultValue: 0);
  box.close();
  return _summ;
}


Future<Object> get_exp() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('exp',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object> get_exp_s() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('exp_s',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object>  get_win() async  {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  final _summ=box.get('win',defaultValue: 0);
  box.close();
  return _summ;
}

Future<Object> get_loos() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('loos',defaultValue: 0);
  box.close();
  return _summ;
}

void mood_summ(final mood) async{
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('mood');
  if(_summ==null){_summ=mood;}
  else {_summ += mood;}
  await box.put('mood',_summ );
  box.close();
}

void mood_sub(final mood )async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('mood_s');
  if(_summ==null){_summ=mood;}
  else {_summ += mood;}
  await box.put('mood_s',_summ );
  box.close();
}


void money_summ(final money)async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('money');
  if(_summ==null){_summ=money;}
  else {_summ += money;}
  await box.put('money',_summ );
  box.close();
}


void money_sub(final money)async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('money_s');
  if(_summ==null){_summ=money;}
  else {_summ += money;}
  await box.put('money_s',_summ );
  box.close();
}


void time_summ(final int  time)async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('time')as int;
  print(time);
  if(_summ==null){_summ=time;}
  else {_summ += time;}
  print('ТУТУТУТУТУТУТТУТУТУТУТТУТУТ$_summ');
  await box.put('time',_summ );
  box.close();
}


void time_sub(final time)async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('time_s');
  if(_summ==null){_summ=time;}
  else {_summ += time;}
  print('ТУТУТУТУТУТУТТУТУТУТУТТУТУТ$_summ');
  await box.put('time_s',_summ );
  box.close();
}

void exp_summ(final exp)async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('exp');
  if(_summ==null){_summ=exp;}
  else {_summ += exp;}
  await box.put('exp',_summ );
  box.close();
}

void exp_sub(final exp)async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('exp_s');
  if(_summ==null){_summ=exp;}
  else {_summ += exp;}
  await box.put('exp_s',_summ );
  box.close();
}

void win_count()async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('win');
  if(_summ==null){_summ=1;}
  else{_summ++;}
  await box.put('win',_summ );
  print("$_summ ПОБЕДАПОБЕДАПОБЕДАПОБЕДАПОБЕДА");
  box.close();
}

void loos_count()async {
  await Hive.initFlutter();
  var box = await Hive.openBox<dynamic>('Counter');
  var _summ=box.get('loos');
  if(_summ==null){_summ=1;}
  else{_summ++;}
  await box.put('loos',_summ );
  box.close();
}


