import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({Key key, @required this.status})
      : assert(status != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getTitle() {
      switch (status) {
        case 'application-sent':
          return Text(
            'Application Sent',
            style: TextStyle(color: Color.fromRGBO(39, 103, 73, 1)),
          );
        case 'interview-set':
          return Text(
            'Interview Set',
            style: TextStyle(color: Color.fromRGBO(44, 82, 130, 1)),
          );
        default:
          return Text(
            'Just a Prospect',
            style: TextStyle(color: Color.fromRGBO(151, 90, 22, 1)),
          );
      }
    }

    Color getBackgroundColor() {
      switch (status) {
        case 'application-sent':
          return Color.fromRGBO(198, 246, 213, 0.9);
        case 'interview-set':
          return Color.fromRGBO(190, 227, 248, 0.9);
        default:
          return Color.fromRGBO(254, 252, 191, 0.9);
      }
    }

    return Chip(
      label: getTitle(),
      backgroundColor: getBackgroundColor(),
    );
  }
}
