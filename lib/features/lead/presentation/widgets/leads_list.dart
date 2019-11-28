import 'package:flutter/material.dart';

import '../../data/models/lead_model.dart';

class LeadsList extends StatelessWidget {
  final List<LeadModel> leads;
  const LeadsList({Key key, @required this.leads})
      : assert(leads != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leads.length,
      itemBuilder: (BuildContext context, int index) {
        final lead = leads[index];
        return Text(lead.companyName);
      },
    );
  }
}
