import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<Map<String, dynamic>> getUserByCPF(String cpf) async {
    var url = Uri.parse(
        'https://8080-igorcalves-condominusba-8hnd04t45m2.ws-us110.gitpod.io/users/cpf?cpf=$cpf');
    try {
      var response = await http.get(url).timeout(Duration(seconds: 2));
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        return {
          'error':
              'Error: ${jsonDecode(utf8.decode(response.bodyBytes))["message"]}'
        };
      }
    } catch (e) {
      return {'error': 'Error: $e'};
    }
  }
}
