import 'package:flutter/material.dart';
import 'package:import_days/api/day.dart';

class TopDayCard extends StatelessWidget {
  final Day day;
  const TopDayCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 15, left: 15, right: 15),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          color: Color.fromRGBO(0, 0, 0, 0.1),
          blurRadius: 10,
        )
      ], color: Color(0xfffcfcfb)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15,
              ),
              Text(
                '${day.title}${day.getDescKeyWord()}',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 33, 33, 33)),
              ),
              Container(
                height: 7,
              ),
              Text(
                '目标日: ${day.getYMD()} ${day.getWeekDay()}',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          Row(
            children: [
              Text(
                '${day.getDiffDaysNum()}',
                style: const TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -5),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Colors.red[600]),
                child: const Text(
                  'Days',
                  style: TextStyle(color: Colors.white, fontSize: 10, shadows: [
                    Shadow(
                        offset: Offset(0, 1),
                        color: Color.fromRGBO(0, 0, 0, 0.3))
                  ]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
