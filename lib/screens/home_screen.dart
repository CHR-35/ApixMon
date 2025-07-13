import '../utils/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInit = true;

  final Map<String, String> tipoTraducciones = {
    'normal': 'Normal',
    'fighting': 'Lucha',
    'flying': 'Volador',
    'poison': 'Veneno',
    'ground': 'Tierra',
    'rock': 'Roca',
    'bug': 'Bicho',
    'ghost': 'Fantasma',
    'steel': 'Acero',
    'fire': 'Fuego',
    'water': 'Agua',
    'grass': 'Planta',
    'electric': 'Eléctrico',
    'psychic': 'Psíquico',
    'ice': 'Hielo',
    'dragon': 'Dragón',
    'dark': 'Siniestro',
    'fairy': 'Hada',
    'unknown': 'Desconocido',
    'shadow': 'Sombra',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isInit = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final provider = Provider.of<PokemonProvider>(context, listen: false);
        provider.fetchAllPokemons();
        provider.fetchTipos();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonProvider>(context);
    final pokemons = provider.displayedPokemons;
    final loading = provider.loading;

    final List<Color> cardColors = [
      Colors.deepPurple.shade700,
      Colors.deepPurple.shade600,
      Colors.teal.shade700,
      Colors.indigo.shade600,
      Colors.blueGrey.shade800,
      Colors.deepOrange.shade700,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Apixmon',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade700,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.info),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                DropdownButton<FilterType>(
                  dropdownColor: Colors.grey[900],
                  value: provider.filterType,
                  style: const TextStyle(color: Colors.white),
                  items: const [
                    DropdownMenuItem(
                      value: FilterType.ninguno,
                      child: Text('Sin filtro'),
                    ),
                    DropdownMenuItem(
                      value: FilterType.region,
                      child: Text('Por Región'),
                    ),
                    DropdownMenuItem(
                      value: FilterType.tipo,
                      child: Text('Por Tipo'),
                    ),
                  ],
                  onChanged: (val) {
                    if (val == null) return;
                    provider.filterType = val;

                    if (val == FilterType.ninguno) {
                      provider.setPokemons(provider.allPokemons);
                    } else if (val == FilterType.region) {
                      provider.selectedRegion = provider.regiones[0];
                      provider.filtrarPorRegion(provider.selectedRegion!);
                    } else if (val == FilterType.tipo) {
                      provider.selectedType = provider.tipos.isNotEmpty
                          ? provider.tipos[0]
                          : null;
                      if (provider.selectedType != null) {
                        provider.filtrarPorTipo(provider.selectedType!);
                      }
                    }
                  },
                ),
                const SizedBox(width: 12),
                if (provider.filterType == FilterType.region)
                  Expanded(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey[900],
                      value: provider.selectedRegion,
                      style: const TextStyle(color: Colors.white),
                      items: provider.regiones
                          .map(
                            (r) => DropdownMenuItem(
                              value: r,
                              child: Text(r.toUpperCase()),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val == null) return;
                        provider.filtrarPorRegion(val);
                      },
                    ),
                  )
                else if (provider.filterType == FilterType.tipo)
                  Expanded(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey[900],
                      value: provider.selectedType,
                      style: const TextStyle(color: Colors.white),
                      items: provider.tipos
                          .map(
                            (t) => DropdownMenuItem(
                              value: t,
                              child: Text(
                                (tipoTraducciones[t] ?? t).toUpperCase(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val == null) return;
                        provider.filtrarPorTipo(val);
                      },
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: provider.filterPokemons,
              decoration: InputDecoration(
                hintText: 'Buscar Pokémon...',
                hintStyle: const TextStyle(color: Colors.white60),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                        ),
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemons[index];
                      final color = cardColors[index % cardColors.length];

                      return FadeInUp(
                        duration: Duration(milliseconds: 300 + index * 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.details,
                              arguments: pokemon.url,
                            );
                          },
                          child: Card(
                            color: color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 6,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: pokemon.name,
                                  child: Image.network(
                                    pokemon.imageUrl,
                                    height: 90,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) => const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  pokemon.name.toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
