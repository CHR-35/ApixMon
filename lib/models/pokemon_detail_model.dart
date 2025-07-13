import 'dart:convert';

PokemonDetail pokemonDetailFromJson(String str) =>
    PokemonDetail.fromJson(json.decode(str));

String pokemonDetailToJson(PokemonDetail data) => json.encode(data.toJson());

class PokemonDetail {
  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
    required this.sprites,
  });

  int id;
  String name;
  int height;
  int weight;
  List<TypeElement> types;
  List<Stat> stats;
  Sprites sprites;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    height: json["height"] ?? 0,
    weight: json["weight"] ?? 0,
    types: json["types"] != null
        ? List<TypeElement>.from(
            json["types"].map((x) => TypeElement.fromJson(x)),
          )
        : [],
    stats: json["stats"] != null
        ? List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x)))
        : [],
    sprites: json["sprites"] != null
        ? Sprites.fromJson(json["sprites"])
        : Sprites(
            other: Other(officialArtwork: OfficialArtwork(frontDefault: '')),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "height": height,
    "weight": weight,
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "sprites": sprites.toJson(),
  };
}

class Stat {
  Stat({required this.baseStat, required this.effort, required this.stat});

  int baseStat;
  int effort;
  StatElement stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"] ?? 0,
    effort: json["effort"] ?? 0,
    stat: StatElement.fromJson(json["stat"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class StatElement {
  StatElement({required this.name, required this.url});

  String name;
  String url;

  factory StatElement.fromJson(Map<String, dynamic> json) =>
      StatElement(name: json["name"] ?? '', url: json["url"] ?? '');

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class TypeElement {
  TypeElement({required this.slot, required this.type});

  int slot;
  TypeType type;

  factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
    slot: json["slot"] ?? 0,
    type: TypeType.fromJson(json["type"] ?? {}),
  );

  Map<String, dynamic> toJson() => {"slot": slot, "type": type.toJson()};
}

class TypeType {
  TypeType({required this.name, required this.url});

  String name;
  String url;

  factory TypeType.fromJson(Map<String, dynamic> json) =>
      TypeType(name: json["name"] ?? '', url: json["url"] ?? '');

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Sprites {
  Sprites({required this.other});

  Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      Sprites(other: Other.fromJson(json["other"] ?? {}));

  Map<String, dynamic> toJson() => {"other": other.toJson()};
}

class Other {
  Other({required this.officialArtwork});

  OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "official-artwork": officialArtwork.toJson(),
  };
}

class OfficialArtwork {
  OfficialArtwork({required this.frontDefault});

  String frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(frontDefault: json["front_default"] ?? '');

  Map<String, dynamic> toJson() => {"front_default": frontDefault};
}
