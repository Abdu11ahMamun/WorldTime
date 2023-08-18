import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location = '';
  String time = '';
  String flag = '';
  String URl = '';
  String datetime = '';
  String offset = '';
  String now = '';

  WorldTime({required this.location, required this.flag, required this.URl});

  Future<void> getTime() async {
    http.Response response =
    await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$URl'));
    Map data = jsonDecode(response.body);

    datetime = data['datetime'];
    offset = data['utc_offset'].substring(1, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }
}
