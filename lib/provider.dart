import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'model.dart';

int _counter = DateTime.now().millisecondsSinceEpoch;

class HiveProvider with ChangeNotifier {
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  List<Model2> _objects = List<Model2>.generate(
    100000,
    (index) {
      return Model2(
        id: index + _counter,
        name: 'Name ${index + _counter}',
      );
    },
  );

  var model1Box = Hive.box<Model1>('model1');
  var model1BoxValues =
      Hive.box<Model1>('model1').values.first.list!.reversed.toList();
  var model2Box = Hive.box<Model2>('model2');

  Future<void> writeModel1() async {
    _counter = _counter + 1;
    await model1Box.add(Model1(id: counter, list: HiveList<Model2>(model2Box)));
    notifyListeners();
  }

  Future<void> writeModel2() async {
    _counter = _counter + 1;
    int _time1, _time2;

    _time1 = DateTime.now().millisecondsSinceEpoch;

    var _m1 = model1Box.values.first;
    var _m2List = HiveList<Model2>(model2Box, objects: _m1.list);

    model2Box.addAll(_objects);
    _m2List.addAll(_objects);
    model1Box.put(_m1.key, Model1(id: _m1.id, list: _m2List));

    _time2 = DateTime.now().millisecondsSinceEpoch;
    print('Time Took: ' + (_time2 - _time1).toString());

    notifyListeners();
  }
}
