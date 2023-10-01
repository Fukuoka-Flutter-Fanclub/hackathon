import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/panorama/controller/panorama_page_controller.dart';
import 'package:hackathon/features/panorama/wigets/filter_list_bar.dart';

import 'filter_controller/filter_controller.dart';

class PanoramaPage extends ConsumerStatefulWidget {
  const PanoramaPage({super.key});

  static const routeName = 'panorama_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends ConsumerState<PanoramaPage> {
  @override
  void initState() {
    super.initState();
    ref.read(panoramaPageStateProvider.notifier).setPosition();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(panoramaPageStateProvider);
    final filter = ref.watch(filterProvider);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: state.topPosition,
            left: state.leftPosition,
            child: Row(
              children: [
                Image.asset(
                  '${filter.imageRef}',
                ),
                Image.asset(
                  '${filter.imageRef}',
                ),
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 500,
                  bottom: 20,
                ),
                child: FilterListBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
