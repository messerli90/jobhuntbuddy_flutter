import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({Key key, @required this.status})
      : assert(status != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _getTextStyle(Color color) {
      return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.0,
        color: color
      );
    }

    Widget getTitle() {
      switch (status) {
        case 'application-sent':
          return Text(
            'Application Sent',
            style: _getTextStyle(Colors.green[800]),
          );
        case 'interview-set':
          return Text(
            'Interview Set',
            style: _getTextStyle(Colors.blue[800]),
          );
        default:
          return Text(
            'Just a Prospect',
            style: _getTextStyle(Colors.orange[500]),
          );
      }
    }

    Color getBackgroundColor() {
      switch (status) {
        case 'application-sent':
          return Colors.green[100];
        case 'interview-set':
          return Colors.blue[100];
        default:
        return Colors.yellow[100];
      }
    }

    return Chip(
      label: getTitle(),
      backgroundColor: getBackgroundColor(),
    );
  }
}
