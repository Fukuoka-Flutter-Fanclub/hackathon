import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/home/data/home_datasource.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(ref: ref),
);

class HomeRepository {
  const HomeRepository({required this.ref});

  final Ref ref;

  HomeFireDatasource get _remote => ref.read(homeFirestoreDatasourceProvider);
}
