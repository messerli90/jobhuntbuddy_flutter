import 'package:flutter/material.dart';

import '../../data/models/lead_model.dart';
import 'status_badge.dart';

class LeadItem extends StatelessWidget {
  final LeadModel lead;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;

  const LeadItem({
    Key key,
    @required this.lead,
    @required this.onTap,
    @required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      title: Hero(
        tag: '${lead.uid}__heroTag',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            lead.companyName,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      subtitle: lead.jobTitle.isNotEmpty
          ? Text(
              lead.jobTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(Colors.grey[700].value)
              )
            )
          : null,
      trailing: StatusBadge(
        status: lead.status,
      ),
    );
  }
}
