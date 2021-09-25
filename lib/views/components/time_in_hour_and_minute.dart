
import 'dart:async';

import 'package:flutter/material.dart';
import '../../size_config.dart';

class TimeInHourAndMinute extends StatefulWidget {
  const TimeInHourAndMinute({Key? key}) : super(key: key);

  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          // _timeofDay.hour shows the hour in 24-hour format.
          // _timeofDay.hourOfPeriod shows the hour in 12-hour format.
          "${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(width: 5),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(10)),
          ),
        ),
      ],
    );
  }
}
