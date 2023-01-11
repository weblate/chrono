import 'package:clock_app/clock/types/time.dart';
import 'package:clock_app/common/widgets/time_display.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as timezone;

class ClockDisplay extends StatelessWidget {
  const ClockDisplay({
    Key? key,
    this.scale = 1,
    this.color,
    this.shouldShowDate = false,
    this.shouldShowSeconds = false,
    required this.dateTime,
    this.timeFormat = TimeFormat.H12,
  }) : super(key: key);

  final TimeFormat timeFormat;
  final double scale;
  final bool shouldShowDate;
  final Color? color;
  final DateTime dateTime;
  final bool shouldShowSeconds;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TimeDisplay(
                format: '${timeFormat == TimeFormat.H12 ? 'h' : 'kk'}:mm',
                fontSize: 72 * scale,
                height: shouldShowDate ? 0.75 : null,
                color: color,
                dateTime: dateTime,
              ),
              SizedBox(width: 4 * scale),
              Column(
                verticalDirection: VerticalDirection.up,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (shouldShowSeconds)
                    TimeDisplay(
                      format: 'ss',
                      fontSize: 36 * scale,
                      height: 1,
                      color: color,
                      dateTime: dateTime,
                    ),
                  Row(
                    children: timeFormat == TimeFormat.H12
                        ? [
                            TimeDisplay(
                              format: 'a',
                              fontSize: (shouldShowSeconds ? 24 : 32) * scale,
                              height: 1,
                              color: color,
                              dateTime: dateTime,
                            ),
                            if (shouldShowSeconds) SizedBox(width: 16 * scale),
                          ]
                        : [
                            if (shouldShowSeconds) SizedBox(width: 56 * scale),
                          ],
                  ),
                ],
              ),
            ]),
        if (shouldShowDate)
          TimeDisplay(
            format: 'EEE, MMM d',
            fontSize: 16 * scale,
            height: 1,
            dateTime: dateTime,
          ),
      ],
    );
  }
}
