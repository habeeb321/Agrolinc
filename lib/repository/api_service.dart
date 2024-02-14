import 'dart:convert';

import 'package:agrolinc/model/login_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> getRegister({name, email, mobile}) async {
    try {
      Uri url = Uri.parse('https://www.api.agrolinc.in/api/register');
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "name": name,
            "email": email,
            "mobile": mobile,
            "role": 1,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return result['msg'];
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<LoginModel?> getLogin({mobile}) async {
    try {
      Uri url = Uri.parse('https://www.api.agrolinc.in/api/login');
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "mobile": mobile,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return LoginModel.fromJson(result);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
