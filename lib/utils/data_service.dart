
import 'dart:convert';

import '../models/SystemItem.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataService {

  List<SystemItem>? _cachedData;

  static DataService? _instance;

  DataService._internal();

  factory DataService() => _instance ??= DataService._internal();

  Future<String> _getJsonData() {
    return rootBundle.loadString('assets/solar_system.json');
  }

  Future<List<SystemItem>> loadData() async {
    if (_cachedData != null) return _cachedData!;

    String data = await _getJsonData();
    List<dynamic> myData = json.decode(data);
    _cachedData = myData
        .map((element) => SystemItem.fromJson(element))
        .cast<SystemItem>()
        .toList();
    return _cachedData!;
  }
}