import 'package:flutter/material.dart';
import 'package:import_days/api/day.dart';
import 'package:import_days/api/file_io.dart';
import 'package:provider/provider.dart';
import 'package:import_days/pages/home.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Import Day',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DaysStorage daysStorage = DaysStorage();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: daysStorage.readData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic mapData = snapshot.data;
          List<Day> daysList = [];
          final Day topDay;
          for (dynamic day in mapData['daysList']) {
            daysList.add(Day.fromJson(day));
          }
          topDay = daysList
              .where((Day day) => day.id == mapData['topDay'])
              .toList()[0];

          return ChangeNotifierProvider(
            create: (context) => UserData(topDay, daysList),
            child: myApp(),
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}

