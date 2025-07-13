class Pokemon {
  final String name;
  final String imageUrl;
  final String url;

  Pokemon({required this.name, required this.imageUrl, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    final id = url.split('/')[url.split('/').length - 2];
    return Pokemon(
      name: json['name'],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
      url: url,
    );
  }
}
