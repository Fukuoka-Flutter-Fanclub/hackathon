import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeLineCard extends ConsumerStatefulWidget {
  const TimeLineCard({
    super.key,
  });

  @override
  ConsumerState<TimeLineCard> createState() => _TimeLineCardState();
}

class _TimeLineCardState extends ConsumerState<TimeLineCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.pending),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  'TimeLineを表示',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                      style: const TextStyle(color: Colors.black45),
                    ),
                    Row(
                      children: [
                        const Text('30'),
                        IconButton(
                          onPressed: () {
                          },
                          icon: const Icon(
                            Icons.favorite_outline,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
