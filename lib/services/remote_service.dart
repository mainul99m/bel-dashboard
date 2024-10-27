import 'package:bel_dashboard/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static Future<LoginResponseModel?> login(String phoneNumber, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://bengal-elasmolab.herokuapp.com/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: <String, String>{
          'phone': phoneNumber,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return loginResponseModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}