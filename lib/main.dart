import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets_rendering_example/03_stateful_lifecycle.dart';
import 'package:widgets_rendering_example/09_future_builder.dart';
import 'package:widgets_rendering_example/12_layout_builder.dart';

import '01_template.dart';
import '02_stateful.dart';
import '04_stateful_did_update.dart';
import '05_many_levels_problem.dart';
import '06_inherited.dart';
import '07_inherited_notifier.dart';
import '08_builder.dart';
import '10_stream_builder.dart';
import '11_value_listenable_builder.dart';

enum Example {
  template,
  stateful,
  stateLifecycle,
  statefulDidUpdate,
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
    final example = Example.layoutBuilder;

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
      case Example.template:
        return MyHomePage(title: 'Flutter Demo Home Page');
      case Example.stateful:
        return MyOwnWidget();
      case Example.stateLifecycle:
        return StatefulLifecycle();
      case Example.statefulDidUpdate:
        return StatefulDidUpdate();
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
