import 'package:flutter/material.dart';
import 'package:import_days/api/day.dart';
import 'package:provider/provider.dart';
import 'package:import_days/components/app_bar.dart';
import 'package:import_days/components/top_day_card.dart';
import 'package:import_days/components/day_item.dart';
import 'package:import_days/tools/tools.dart';

Widget myApp() {
  return Consumer<UserData>(builder: (context, userData, child) {
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
                          if (userData.topDay.id != '')
                            TopDayCard(
                              day: userData.topDay,
                            ),
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  height: 15,
                                ),
                                if (userData.daysList.isNotEmpty)
                                  for (Day day in userData.daysList)
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        userData.addDay(Day(getNowStamp(), '2024-1-1', '2024元旦节日'));
        // snapshot.data?.addDay(Day('123', '2024-5-1', '劳动节'));
      }),
    );
  });
}
