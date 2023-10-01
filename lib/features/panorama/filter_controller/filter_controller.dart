import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  current('現在', 'assets/images/current.png'),
  past('昔', 'assets/images/past.png'),
  future('近未来', 'assets/images/future.png'),
  fantasy('異世界', 'assets/images/fantasy.png'),
  ;

  const Filter(this.text, this.imageRef);

  final String text;
  final String imageRef;
}

final filterProvider = StateProvider<Filter>((ref) {
  return Filter.current;
});
