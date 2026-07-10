import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/restoran_model.dart';

class RestoranProvider with ChangeNotifier {
  List<RestoranModel> _restorans = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<RestoranModel> get restorans => _restorans;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchRestorans() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Mengambil data restoran dari API
      final response = await http.get(Uri.parse('https://run.mocky.io/v3/4ccfb382-f584-469b-8e10-c1f034cb72e0'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _restorans = data.map((json) => RestoranModel.fromJson(json)).toList();
      } else {
        _useLocalData();
      }
    } catch (e) {
      _useLocalData();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorit(int index) {
    _restorans[index].favorit = !_restorans[index].favorit;
    notifyListeners();
  }

  void _useLocalData() {
    // Data lokal jika gagal fetch server
    final localData = [
      {
        'nama': 'Donat Bahagiat',
        'kategori': 'Kue & Roti',
        'rating': 4.5,
        'jarak': '0.8 km',
        'gambar': 'https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400&q=80',
        'favorit': false,
      },
      {
        'nama': 'Seporsi Mie Kari',
        'kategori': 'Mie & Bakso',
        'rating': 4.7,
        'jarak': '1.2 km',
        'gambar': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=400&q=80',
        'favorit': true,
      },
      {
        'nama': 'Soes Surgawi',
        'kategori': 'Kue & Roti',
        'rating': 5.0,
        'jarak': '0.5 km',
        'gambar': 'https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=400&q=80',
        'favorit': false,
      },
      {
        'nama': 'Nasi Goreng Kambing',
        'kategori': 'Nasi & Lauk',
        'rating': 4.6,
        'jarak': '1.7 km',
        'gambar': 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=400&q=80',
        'favorit': false,
      }
    ];
    _restorans = localData.map((json) => RestoranModel.fromJson(json)).toList();
  }
}
