import '../utils/exports.dart';

class AppRoutes {
  static const home = '/';
  static const details = '/details';
  static const info = '/info';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    info: (context) => const InfoScreen(),
    details: (context) {
      final url = ModalRoute.of(context)!.settings.arguments as String;
      return DetailsScreen(pokemonUrl: url);
    },
  };
}
