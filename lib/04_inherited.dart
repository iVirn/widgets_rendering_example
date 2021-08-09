import 'package:flutter/material.dart';

class TitleProvider extends InheritedWidget {
  final String title;
  final Widget child;

  TitleProvider({
    required this.title,
    required this.child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TitleProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TitleProvider>();
}

class IneritedRootLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidget'),
        ),
        body: SecondLevelWidget(),
      );
}

class SecondLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => HelloWorldDecorationWidget();
}

class HelloWorldDecorationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
        ),
        alignment: Alignment.center,
        child: HelloWorldTitleOnlyWidget(),
      );
}

class HelloWorldTitleOnlyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final title =
        '${TitleProvider.of(context)?.title ?? 'broken data'}\nSize: ${size.toString()}';

    print(size);

    return Text(
      title,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 40),
    );
  }
}
