import '../utils/exports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum FilterType { ninguno, region, tipo }

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _allPokemons = [];
   List<Pokemon> get allPokemons => _allPokemons;
  List<Pokemon> _displayedPokemons = [];
  bool loading = false;

  FilterType filterType = FilterType.ninguno;
  String? selectedRegion;
  String? selectedType;

  List<String> regiones = [
    'kanto',
    'johto',
    'hoenn',
    'sinnoh',
    'unova',
    'kalos',
    'alola',
    'galar',
  ];

  List<String> tipos = [];

  List<Pokemon> get displayedPokemons => _displayedPokemons;

  void setPokemons(List<Pokemon> pokemons) {
    _allPokemons = pokemons;
    _displayedPokemons = pokemons;
    notifyListeners();
  }

  void setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  Future<void> fetchAllPokemons() async {
    setLoading(true);
    final url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?limit=898',
    ); 
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      final loaded = results.map((p) => Pokemon.fromJson(p)).toList();
      _allPokemons = loaded;
      _displayedPokemons = loaded;
      setLoading(false);
    }
  }

  Future<void> fetchTipos() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/type'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      tipos = (data['results'] as List)
          .map((t) => t['name'].toString())
          .toList();
      notifyListeners();
    }
  }

  Future<void> filtrarPorRegion(String region) async {
    filterType = FilterType.region;
    selectedRegion = region;
    setLoading(true);

    final idRegion = _regionToId(region);
    final url = Uri.parse('https://pokeapi.co/api/v2/generation/$idRegion');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List species = data['pokemon_species'];


      species.sort((a, b) => a['name'].compareTo(b['name']));

      final loaded = species.map((p) => Pokemon.fromJson(p)).toList();

      _displayedPokemons = loaded;
      setLoading(false);
    }
  }

  Future<void> filtrarPorTipo(String tipo) async {
    filterType = FilterType.tipo;
    selectedType = tipo;
    setLoading(true);

    final url = Uri.parse('https://pokeapi.co/api/v2/type/$tipo');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List pokemonsList = data['pokemon'];
      final loaded = pokemonsList
          .map((p) => Pokemon.fromJson(p['pokemon']))
          .toList();
      _displayedPokemons = loaded;
      setLoading(false);
    }
  }

  void filterPokemons(String query) {
    List<Pokemon> filtered;
    if (filterType == FilterType.ninguno) {
      filtered = _allPokemons
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filtered = _displayedPokemons
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    _displayedPokemons = filtered;
    notifyListeners();
  }

  int _regionToId(String region) {
    switch (region.toLowerCase()) {
      case 'kanto':
        return 1;
      case 'johto':
        return 2;
      case 'hoenn':
        return 3;
      case 'sinnoh':
        return 4;
      case 'unova':
        return 5;
      case 'kalos':
        return 6;
      case 'alola':
        return 7;
      case 'galar':
        return 8;
      default:
        return 1;
    }
  }
}
