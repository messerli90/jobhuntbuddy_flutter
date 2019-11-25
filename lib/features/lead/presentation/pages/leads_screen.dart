import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/lead_bloc.dart';

class LeadsListPage extends StatefulWidget {
  const LeadsListPage({Key key}) : super(key: key);

  @override
  _LeadsListPageState createState() => _LeadsListPageState();
}

class _LeadsListPageState extends State<LeadsListPage> {
  // LeadBloc _leadBloc;
  // LeadRepositoryImpl get _leadRepository => widget._leadRepository;

  // @override
  // void initState() {
  //   super.initState();
  //   _leadBloc = LeadBloc(leadRepositoryImpl: _leadRepository);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<LeadBloc>(
        builder: (BuildContext context) => sl<LeadBloc>(),
        child: Scaffold(
          body: Center(child: Text('Leads')),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _leadBloc.close();
  //   super.dispose();
  // }
}
