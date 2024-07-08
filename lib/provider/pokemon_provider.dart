import 'package:flutter/material.dart';
import '../services/api_services.dart';

class PokemonProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Map<String, String>> _httpCatList = [];
  bool _isLoading = false;

  List<Map<String, String>> get httpCatList => _httpCatList;
  bool get isLoading => _isLoading;

  Future<void> fetchHttpCats() async {
    _isLoading = true;
    notifyListeners();

    _httpCatList = await _apiService.fetchHttpCatList();
    _isLoading = false;
    notifyListeners();
  }
}
