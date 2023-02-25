import 'package:flutter/material.dart';
import 'package:import_days/api/day.dart';
import 'package:import_days/api/get_data.dart';
import 'package:import_days/components/day_item.dart';
import 'package:import_days/components/app_bar.dart';
import 'package:import_days/components/top_day_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Day> daysArray = snapshot.data?.daysList ?? [];
            Day topDay = snapshot.data?.topDay ?? Day('', '', '');
            return Scaffold(
              appBar: myAppBar(),
              body: Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  color: Colors.grey[600],
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                    )
                                  ],
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color.fromRGBO(230, 230, 230, 1)
                                      ])),
                              child: Column(
                                children: [
                                  if (topDay.id != '')
                                    TopDayCard(
                                      day: topDay,
                                    ),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        Container(
                                          height: 15,
                                        ),
                                        if (daysArray.isNotEmpty)
                                          for (Day day in daysArray)
                                            DayItem(
                                              day: day,
                                            ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Container(
                        height: 30,
                      )
                    ],
                  )),
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const Text('loading');
          }
        }));
  }
}
