import 'package:flutter/material.dart';

class MyOwnWidget extends StatefulWidget {
  @override
  _MyOwnWidgetState createState() => _MyOwnWidgetState();
}

class _MyOwnWidgetState extends State<MyOwnWidget> {
  bool _isShapeCircle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
      ),
      body: GestureDetector(
        onTap: () => setState(() => _isShapeCircle = !_isShapeCircle),
        // onTap: () => _isShapeCircle = !_isShapeCircle,
        // onTap: () {
        //   _isShapeCircle = !_isShapeCircle;
        //   (context as Element).markNeedsBuild();
        // },
        child: Container(
          decoration: BoxDecoration(
            shape: _isShapeCircle ? BoxShape.circle : BoxShape.rectangle,
            color: _isShapeCircle ? Colors.lime : Colors.lightGreen,
          ),
          alignment: Alignment.center,
          child: Text(
            'Hello, world!',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
