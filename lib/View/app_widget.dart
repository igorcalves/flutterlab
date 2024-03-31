import 'package:flutter/material.dart';
import 'package:learn/domain/regras_negocio/user_bloc.dart';
import 'package:learn/View/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar Pessoa',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green

      ),
      home: MyHomePage(
        userBloc: UserBloc(),
      ),
    );
  }
}
