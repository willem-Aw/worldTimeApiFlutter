// ignore: file_names
import 'package:http/http.dart' as http;
import 'dart:convert'; //make us able to use the JsonDecode
import 'package:intl/intl.dart';

class WorldTime {
  String location = ""; //location name for the UI
  String time = ""; //time int that location
  String day = ""; //day
  String month = ""; //month
  String year = ""; //year
  String flag = ""; //url to an asset flag icon
  String url = ""; //location for api endpoint
  bool isDayTime = false; //is day time or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // making request
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(datetime);
      // print(offset);
      // create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      day = now.day.toString();
      month = now.month.toString();
      year = now.year.toString();
      // print(month);
      // print(day);
      // print(year);
      // set the time property and format it with intl package
      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      // ignore: avoid_print
      print("caught error: $e");
      time = 'could not get time data';
    }
  }
}
/**
 * Future is like the promise in javascript
 * Future here is like, I'm going to return void when that whole thing is done.
 * If we want to use await on a custom function, we have to put "Future" keyword in front of async function
 */