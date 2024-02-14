import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>?> getRegister(
      {name, email, mobile}) async {
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
        return result;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getLogin({mobile}) async {
    try {
      Uri url = Uri.parse('https://www.api.agrolinc.in/api/login');
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "mobile": mobile,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return result;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getOtp({otp, userId}) async {
    try {
      Uri url = Uri.parse('https://www.api.agrolinc.in/api/verifyLoginOtp');
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "userId": userId,
            "otp": otp,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return result;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
