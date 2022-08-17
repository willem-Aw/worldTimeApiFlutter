import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        url: 'Africa/Maputo', location: 'Mozambique', flag: 'Mozambique.jpeg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubaï', flag: 'UAE.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'German.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(
        url: 'Indian/Antananarivo', location: 'Antananarivo', flag: 'mdg.png'),
  ];

  ///update the time  for each element in the list and redirect to the home screen
  void updateTime(index) async {
    // here we don't create a new instance, just store the current location top the local type(WorldTime)
    WorldTime instance = locations[index];
    // wait till the time is ready
    await instance.getTime();
    // navigate to the home screen and pass the data to home screen
    // here, we pop off the current page form the route to navigate to the home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("choose the location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/**
 * It's similar to promise javascript(async,await)
 * When we need data from one func to run the others
 * we should make the function to "async" and make the function that needed to be finished first as "await"
 */