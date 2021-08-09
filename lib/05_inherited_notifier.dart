import 'dart:math' as math;

import 'package:flutter/material.dart';

class InheritedNotifierExample extends StatefulWidget {
  InheritedNotifierExample({Key? key}) : super(key: key);

  @override
  _InheritedNotifierExampleState createState() =>
      _InheritedNotifierExampleState();
}

class _InheritedNotifierExampleState extends State<InheritedNotifierExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('InheritedNotifierExample build');
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedNotifier'),
      ),
      body: Center(
        child: SpinModel(
          notifier: _controller,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Spinner(),
              Spinner(),
              Spinner(),
            ],
          ),
        ),
      ),
    );
  }
}

class SpinModel extends InheritedNotifier<AnimationController> {
  SpinModel({
    Key? key,
    required AnimationController notifier,
    required Widget child,
  }) : super(
          key: key,
          notifier: notifier,
          child: child,
        );

  static double? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SpinModel>()
        ?.notifier
        ?.value;
  }
}

class Spinner extends StatelessWidget {
  const Spinner();

  @override
  Widget build(BuildContext context) {
    // print('spinner build');

    final value = SpinModel.of(context) ?? 0;

    return Transform.rotate(
      angle: value * 2.0 * math.pi,
      child: Container(
        width: 75,
        height: 75,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
    );
  }
}
