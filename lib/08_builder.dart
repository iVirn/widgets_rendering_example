import 'package:flutter/material.dart';

class MyBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: GestureDetector(
            child: FlutterLogo(
              style: FlutterLogoStyle.stacked,
              size: 100,
            ),
            onTap: () => _showBottomSheet(context, 'Hello there!'),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () => _showBottomSheet(context, 'Hello there!'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String title) {
    final widget = Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue,
      child: Text(title),
    );
    Scaffold.of(context).showBottomSheet((context) => widget);
  }
}
