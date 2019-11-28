import 'package:flutter/material.dart';
import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';

class LeadItem extends StatelessWidget {
  final LeadModel lead;
  final GestureTapCallback onTap;

  const LeadItem({
    Key key,
    @required this.lead,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
              style: Theme.of(context).textTheme.subhead,
            )
          : null,
    );
  }
}
