import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import '../bloc/auth/bloc.dart';

class ProfileScreen extends StatelessWidget {
  // final UserModel user;
  const ProfileScreen({Key key}) : super(key: key);

  Widget _userName(UserModel user) {
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Column(
            children: <Widget>[
              _userName(state.user),
              _logoutBtn(context),
            ],
          );
        }
      },
    );
  }
}
