import 'package:flutter/material.dart';
import 'package:learn/domain/regras_negocio/user_bloc.dart';
import 'package:learn/domain/regras_negocio/user_form.dart';

class user_ui extends StatelessWidget {
  final UserBloc userBloc;

  user_ui({
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Usuarios'),
      ),
      body: UserForm(
        userBloc: userBloc,
      ),
    );
  }
}
