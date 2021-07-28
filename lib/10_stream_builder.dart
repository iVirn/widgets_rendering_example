import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderSample extends StatefulWidget {
  @override
  _StreamBuilderSampleState createState() => _StreamBuilderSampleState();
}

class _StreamBuilderSampleState extends State<StreamBuilderSample> {
  final stream = Stream<String?>.periodic(Duration(seconds: 1), (count) {
    if (count == 0) {
      return null;
    }

    if (count % 5 == 0 && count % 3 == 0) {
      throw Exception('fizzbuzz');
    } else if (count % 3 == 0) {
      return 'fizz $count';
    } else if (count % 5 == 0) {
      return 'buzz $count';
    }
    return '$count';
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilderSample'),
        actions: [],
      ),
      body: StreamBuilder<String?>(
        stream: stream,
        builder: (context, snapshot) {
          final _data = snapshot.data;
          if (_data != null) {
            return Center(
              child: Text(_data),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
