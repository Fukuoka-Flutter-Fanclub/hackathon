import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  current('現在', 'assets/images/panorama_sample.jpg'),
  past('昔', 'hagehage'),
  future('近未来', 'pogepoge'),
  fantasy('異世界', 'chogechoge'),
  ;

  const Filter(this.text, this.imageRef);

  final String text;
  final String imageRef;
}

final filterProvider = StateProvider<Filter>((ref) {
  return Filter.current;
});
