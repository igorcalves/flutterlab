import 'dart:async';
import 'package:learn/domain/user/User.dart';
import 'package:learn/repository/user_repository.dart';

class UserBloc {
  final _userRepository = UserRepository();
  final _userController = StreamController<User?>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  Stream<User?> get userStream => _userController.stream;
  Stream<String> get errorStream => _errorController.stream;

  void getUserByCPF(String cpf) async {
    var response = await _userRepository.getUserByCPF(cpf);
    if (response.containsKey('error')) {
      _errorController.sink.add(response['error']);
      _userController.sink.add(null);
    } else {
      _userController.sink.add(User.fromJson(response));
      _errorController.sink.add('');
    }
  }

  void dispose() {
    _userController.close();
    _errorController.close();
  }
}
