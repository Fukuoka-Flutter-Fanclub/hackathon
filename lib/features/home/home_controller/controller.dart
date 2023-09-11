import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/home/home_repository/home_repository.dart';

final homeProvider = Provider(
  (ref) => HomeController(ref: ref),
);

class HomeController {
  const HomeController({required this.ref});

  final Ref ref;

  HomeRepository get _repository => ref.read(homeRepositoryProvider);
}
