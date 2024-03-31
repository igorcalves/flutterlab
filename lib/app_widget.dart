import 'package:flutter/material.dart';
import 'package:learn/domain/regras_negocio/user_bloc.dart';
import 'package:learn/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar Pessoa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        userBloc: UserBloc(),
      ),
    );
  }
}
