import 'dart:async';

import 'package:clean_architecture/data/pixabay_api_repository.dart';
import 'package:clean_architecture/model/Photo.dart';

class HomeViewModel {
  final PixabayApiRepository repository;

  final _streamCtrl = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _streamCtrl.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _streamCtrl.add(result);
  }
}