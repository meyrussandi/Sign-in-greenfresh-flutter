part of 'services.dart';

class APIService {
  Future loginPengguna(Pengguna pengguna) async {
    try {
      final response = await http.post(baseUrl + "login", body: {
        'email': pengguna.email,
        'password': pengguna.password,
      });

      if (response.statusCode == 200) {
        return penggunaModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("Exception Login $e");
      return null;
    }
  }

  Future registerPengguna(Pengguna pengguna) async {
    try {
      final response = await http.post(baseUrl + "register", body: {
        'email': pengguna.email,
        'password': pengguna.password,
        'namaPengguna': pengguna.namaPengguna,
        'noHp': pengguna.noHp,
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("Exception $e");
      return null;
    }
  }
}

final apiService = APIService();
