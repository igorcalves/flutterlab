import 'package:flutter/material.dart';
import 'package:learn/domain/user/User.dart';

import 'user_bloc.dart';

class UserForm extends StatelessWidget {
  final UserBloc userBloc;
  final TextEditingController cpfController = new TextEditingController();

  UserForm({
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: cpfController,
          decoration: InputDecoration(labelText: 'Enter CPF'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            userBloc.getUserByCPF(cpfController.text);
          },
          child: Text('Get User'),
        ),
        SizedBox(height: 20),
        StreamBuilder<User?>(
          stream: userBloc.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.toString());
            } else {
              return StreamBuilder<String>(
                stream: userBloc.errorStream,
                builder: (context, errorSnapshot) {
                  if (errorSnapshot.hasData && errorSnapshot.data!.isNotEmpty) {
                    return Text(
                      errorSnapshot.data!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              );
            }
          },
        ),
      ],
    );
  }
}
