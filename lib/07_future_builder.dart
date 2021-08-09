import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderSample extends StatefulWidget {
  @override
  _FutureBuilderSampleState createState() => _FutureBuilderSampleState();
}

class _FutureBuilderSampleState extends State<FutureBuilderSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilderSample'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          )
        ],
      ),
      body: FutureBuilder<String?>(
        // initialData: 'I am an initial data',
        future: Future<String?>.delayed(Duration(seconds: 3)).then((value) {
          // throw Exception('Casual error');
          return 'I am done, result: ${Random().nextInt(100)}';
        }),
        builder: (context, snapshot) {
          print('connectionState: ${snapshot.connectionState}');
          print('data:${snapshot.data}');

          if (snapshot.connectionState == ConnectionState.none) {}

          if (snapshot.connectionState == ConnectionState.waiting) {}

          if (snapshot.connectionState == ConnectionState.active) {}

          if (snapshot.connectionState == ConnectionState.done) {}

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          final _data = snapshot.data;
          if (_data != null) {
            return Center(
              child: Text(
                _data,
                textAlign: TextAlign.center,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
