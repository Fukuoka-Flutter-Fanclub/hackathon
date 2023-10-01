import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/panorama/filter_controller/filter_controller.dart';

class FilterListBar extends ConsumerStatefulWidget {
  const FilterListBar({
    super.key,
  });

  @override
  ConsumerState<FilterListBar> createState() => _FilterListBarState();
}

class _FilterListBarState extends ConsumerState<FilterListBar> {
  Filter? val = Filter.current;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Filter>(
        value: ref.watch(filterProvider),
        style: const TextStyle(
          color: Colors.black,
        ),
        dropdownColor: Colors.indigo[100],
        onChanged: (Filter? value) async {
          ref.read(filterProvider.notifier).state = value ?? Filter.current;
        },
        items: Filter.values.map<DropdownMenuItem<Filter>>(
          (Filter filter) {
            return DropdownMenuItem<Filter>(
              value: filter,
              child: Text('${filter.text}風'),
            );
          },
        ).toList(),
      ),
    );
  }
}
