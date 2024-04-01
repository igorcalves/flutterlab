import 'package:flutter/material.dart';
import 'package:learn/domain/regras_negocio/user_bloc.dart';
import 'package:learn/View/home_page.dart';
import 'package:learn/repository/UserFakeRepository.dart';
import 'package:learn/repository/fakeDb.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar Pessoa',
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.green),
      home: MyHomePage(
        userBloc: UserBloc(FakeRepository(
          MyRepo.getData(),
        )),
      ),
    );
  }
}
