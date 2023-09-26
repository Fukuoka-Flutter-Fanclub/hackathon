import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeFirestoreDatasourceProvider = Provider(
  (_) => HomeFireDatasource(),
);

class HomeFireDatasource {
  final _db = FirebaseFirestore.instance;
}
