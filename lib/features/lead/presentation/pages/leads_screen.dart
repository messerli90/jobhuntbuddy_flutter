import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../bloc/lead_bloc.dart';
import '../widgets/leads_list.dart';

class LeadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeadBloc>(
      builder: (BuildContext context) => sl<LeadBloc>(),
      child: BlocBuilder<LeadBloc, LeadState>(
        builder: (
          BuildContext context,
          LeadState state,
        ) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            final leads = state.leads;
            return LeadsList(leads: leads);
          } else {
            return Center(
              child: Text('Else'),
            );
          }
        },
      ),
    );
  }
}
