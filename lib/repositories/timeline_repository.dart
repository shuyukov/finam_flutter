import 'package:finam_flutter/data_providers/api.dart';
import 'package:finam_flutter/models/model.dart';

class TimelineRepository {
  TimelineRepository(this._apiDataProvider);

  final ApiDataProvider _apiDataProvider;

  Future<List<Children>> getCurrentList() async {
    final data = await _apiDataProvider.getCurrentData();
    return data.children;
  }
}