import 'package:flutter/material.dart';

enum Statuses { pending, done, accepted }

class StatusFilters extends StatefulWidget {
  const StatusFilters({super.key});

  @override
  State<StatusFilters> createState() => _StatusFiltersState();
}

class _StatusFiltersState extends State<StatusFilters> {
  Statuses calendarView = Statuses.accepted;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Statuses>(
      segments: const <ButtonSegment<Statuses>>[
        ButtonSegment<Statuses>(
            value: Statuses.accepted,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Statuses>(
            value: Statuses.pending,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Statuses>(
            value: Statuses.done,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
      ],
      selected: <Statuses>{calendarView},
      onSelectionChanged: (Set<Statuses> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}
