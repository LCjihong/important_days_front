import 'package:flutter/material.dart';
import 'package:import_days/api/day.dart';
import 'package:import_days/style/day_item.dart';

class DayItem extends StatelessWidget {
  final Day day;
  ItemStyle get itemStyle =>
      day.isAfterDay ? AfterDayStyle() : BeforeDayStyle();
  const DayItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 15,
      ),
      decoration: containerStyle,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: titleBackgroundStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${day.title}${day.getDescKeyWord()}',
                  style: titleTextStyle,
                ),
              ),
              SizedBox(
                width: 120,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      height: 40,
                      width: 80,
                      child: Container(
                        decoration: itemStyle.daysNumberBackgroundStyle,
                        child: Center(
                          child: Text(
                            '${day.getDiffDaysNum()}',
                            style: itemStyle.daysNumberStyle,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: itemStyle.unitBackgroundStyle,
                        child: Center(
                          child: Text(
                            '天',
                            style: itemStyle.unitTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
