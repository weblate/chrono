import 'package:flutter/material.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:timezone/timezone.dart' as timezone;

import 'package:clock_app/clock/types/time.dart';

import 'clock_display.dart';

class Clock extends StatelessWidget {
  const Clock({
    Key? key,
    this.scale = 1,
    this.shouldShowDate = false,
    this.shouldShowSeconds = false,
    this.timeFormat = TimeFormat.H12,
    this.color,
    this.timezoneLocation,
  }) : super(key: key);

  final double scale;
  final bool shouldShowDate;
  final TimeFormat timeFormat;
  final bool shouldShowSeconds;
  final Color? color;
  final timezone.Location? timezoneLocation;

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      const Duration(seconds: 1),
      builder: (context) {
        DateTime dateTime;
        if (timezoneLocation != null) {
          dateTime = timezone.TZDateTime.now(timezoneLocation!);
        } else {
          dateTime = DateTime.now();
        }
        return ClockDisplay(
          timeFormat: timeFormat,
          scale: scale,
          shouldShowDate: shouldShowDate,
          color: color,
          shouldShowSeconds: shouldShowSeconds,
          dateTime: dateTime,
        );
      },
    );
  }
}
