import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '01_stateful.dart';
import '02_stateful_lifecycle.dart';
import '03_many_levels_problem.dart';
import '04_inherited.dart';
import '05_inherited_notifier.dart';
import '06_builder.dart';
import '07_future_builder.dart';
import '08_stream_builder.dart';
import '09_value_listenable_builder.dart';
import '10_layout_builder.dart';

enum Example {
  stateful,
  stateLifecycle,
  manyLevels,
  inherited,
  inheritedNotifier,
  builderParentContext,
  futureBuilder,
  streamBuilder,
  valueListenableBuilder,
  layoutBuilder,
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final example = Example.stateful;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getExample(example),
    );
  }

  Widget _getExample(Example example) {
    switch (example) {
      case Example.stateful:
        return MyOwnWidget();
      case Example.stateLifecycle:
        return StatefulLifecycle(text: 'Hello, world!');
      case Example.manyLevels:
        return RootLevelWidget(title: 'Hello, world!');
      case Example.inherited:
        return TitleProvider(
          title: 'Hello, world!',
          child: IneritedRootLevelWidget(),
        );
      case Example.inheritedNotifier:
        return InheritedNotifierExample();
      case Example.builderParentContext:
        return MyBuilderWidget();
      case Example.futureBuilder:
        return FutureBuilderSample();
      case Example.streamBuilder:
        return StreamBuilderSample();
      case Example.valueListenableBuilder:
        return ValueListenableSample();
      case Example.layoutBuilder:
        return LayoutBuilderSample();
    }
  }
}
