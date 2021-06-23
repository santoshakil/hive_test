import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/model.dart';
import 'package:hive_test/provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Hive.registerAdapter(Model1Adapter());
  Hive.registerAdapter(Model2Adapter());
  await Hive.initFlutter('hive_test');
  await Hive.openBox<Model1>('model1');
  await Hive.openBox<Model2>('model2');

  runApp(
    ChangeNotifierProvider<HiveProvider>(
      create: (_) => HiveProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Main(),
      ),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<HiveProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _provider.writeModel1,
              child: Text('Write Model 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _provider.writeModel2,
              child: Text('Write Model 2 List'),
            ),
          ),
          Column(
            children: [
              Text(
                'Model 1 Length: ' +
                    _provider.model1Box.values.length.toString(),
              ),
              Text(
                'Model 2 Length: ' +
                    _provider.model2Box.values.length.toString(),
              ),
            ],
          ),
          _provider.model1Box.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: _provider.model1Box.values.first.list!.length,
                  itemBuilder: (_, i) =>
                      Text(_provider.model1Box.values.first.list![i].name!),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
