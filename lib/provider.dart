import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'model.dart';

class HiveProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => this._counter;
  set counter(int value) {
    this._counter = value;
    notifyListeners();
  }

  var model1Box = Hive.box<Model1>('model1');
  var model2Box = Hive.box<Model2>('model2');

  Future<void> writeModel1() async {
    _counter = _counter + 1;
    await model1Box.add(Model1(id: counter, list: HiveList<Model2>(model2Box)));
    notifyListeners();
  }

  Future<void> writeModel2() async {
    _counter = _counter + 1;
    var _object = Model2(id: counter, name: 'Name $counter');
    var _m1 = model1Box.values.last;
    model2Box.add(_object);
    var _m2List = HiveList<Model2>(model2Box, objects: _m1.list);
    _m2List.add(_object);
    model1Box.put(_m1.key, Model1(id: _m1.id, list: _m2List));

    notifyListeners();
  }
}
