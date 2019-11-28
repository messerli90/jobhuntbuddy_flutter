import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import '../bloc/auth/bloc.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  const ProfileScreen({Key key, this.user})
      : assert(user != null),
        super(key: key);

  Widget _userName() {
    return Text(user.email);
  }

  _logoutBtn(context) {
    return RaisedButton.icon(
      icon: Icon(Icons.exit_to_app),
      label: Text('Logout'),
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(LoggedOut());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _userName(),
          _logoutBtn(context),
        ],
      ),
    );
  }
}
