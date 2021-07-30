import 'package:flutter/material.dart';

class RootLevelWidget extends StatelessWidget {
  final String title;

  const RootLevelWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Many Levels')),
        body: SecondLevelWidget(
          title: this.title,
        ),
      );
}

class SecondLevelWidget extends StatelessWidget {
  final String title;

  const SecondLevelWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => HelloWorldDecorationWidget(
        title: this.title,
      );
}

class HelloWorldDecorationWidget extends StatelessWidget {
  final String title;

  const HelloWorldDecorationWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        alignment: Alignment.center,
        child: HelloWorldTitleOnlyWidget(
          title: title,
        ),
      );
}

class HelloWorldTitleOnlyWidget extends StatelessWidget {
  final String title;

  HelloWorldTitleOnlyWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        title,
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.black, fontSize: 40),
      );
}
