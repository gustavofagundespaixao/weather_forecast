import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('E, dd MMM').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Today', style: TextStyle(fontSize: 26)),
        SizedBox(height: 4),
        Text(dateFormat, style: TextStyle(fontWeight: FontWeight.w300)),
      ],
    );
  }
}
