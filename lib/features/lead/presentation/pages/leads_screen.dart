import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/lead_bloc.dart';
import '../widgets/lead_item.dart';

class LeadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadBloc, LeadState>(
      builder: (context, state) {
        if (state is LeadsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LeadsLoaded) {
          final leads = state.leads;
          return ListView.builder(
            itemCount: leads.length,
            itemBuilder: (context, index) {
              final lead = leads[index];
              debugPrint('${lead.toString()} leads loaded');
              return Card(
                child: LeadItem(
                  lead: lead,
                  onTap: () async {
                    debugPrint('Clicked ${lead.uid}');
                    // navigate to lead
                  },
                  onLongPress: () async {
                    debugPrint('long press');
                  },
                ),
              );
            },
          );
        } else {
          return Center(child: Text('Error'));
        }
      },
    );
  }
}
