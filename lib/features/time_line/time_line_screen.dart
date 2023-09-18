import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/time_line/widgets/time_line_card.dart';


class TimeLineScreen extends ConsumerStatefulWidget {
  const TimeLineScreen({super.key});

  static const routeName = 'time_line';

  @override
  ConsumerState<TimeLineScreen> createState() => _TimeLineScreenState();
}


class _TimeLineScreenState extends ConsumerState<TimeLineScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
      body: ListView(
        children: const [
          Column(
            children: [
              TimeLineCard(),
            ],
          ),
        ],
      ),
    );;
  }
}
