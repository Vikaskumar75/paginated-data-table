import 'package:http/http.dart' as http;
import 'user_model.dart';

Future<List<Users>> fetchData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  final response = await http.get(url);

  List<Users> users = usersFromJson(response.body);

  return users;
}
