import '../utils/exports.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Acerca de los Desarrolladores',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          DeveloperCard(
            name: 'Christopher Balkaran',
            role: 'Desarrollador de Apixmon',
            description:
                'Estudiante de Ingeniería en Sistemas en UNIMAR. Apasionado por la programación y recientemente al Flutter.',
            assetImagePath: 'assets/images/dev1.jpg',
          ),
          SizedBox(height: 20),
          DeveloperCard(
            name: 'Geremmy Ferrer',
            role: 'Desarrollador de Apixmon',
            description:
                'Creador de la lógica, estructura y experiencia visual. Amante del diseño elegante y las interfaces funcionales.',
            assetImagePath: 'assets/images/dev2.jpg',
          ),
        ],
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String role;
  final String description;
  final String assetImagePath;

  const DeveloperCard({
    super.key,
    required this.name,
    required this.role,
    required this.description,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                assetImagePath,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white70,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontFamily: 'Lato',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Lato',
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
