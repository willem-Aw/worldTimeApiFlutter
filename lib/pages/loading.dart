// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /// the third parameter of the Navigator(arguments:{map}) sends the data to the widget where we redirect
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Antananarivo",
        flag: 'malagasy.png',
        url: 'Indian/Antananarivo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'month': instance.month,
      'day': instance.day,
      'year': instance.year,
      'isDayTime': instance.isDayTime,
    }); //push the navigation to the Home screen and replace the current route(push and pop)
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        // use the flutter_spinkit
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
