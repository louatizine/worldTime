import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      // Make the request
      final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Get properties from JSON
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        String offsetMinutes = data['utc_offset'].substring(4, 6);

        // Create DateTime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(
          hours: int.parse(offset),
          minutes: int.parse(offsetMinutes),
        ));

        // Set the time property
        isDaytime = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      } else {
        throw Exception('Failed to load time data');
      }
    } catch (e) {
      print('Error: $e');
      time = 'Could not get time';
    }
  }
}
