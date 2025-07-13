# ApixMon 🧬🔥

**ApixMon** es una aplicación móvil desarrollada con **Flutter**, que consume la [PokeAPI](https://pokeapi.co/) para mostrar una Pokédex interactiva con búsqueda, filtros por tipo o región, y detalles visuales de cada Pokémon. Posee un diseño oscuro elegante, moderno y amigable para el usuario.

---

## ✨ Características

- 🔎 Búsqueda de Pokémon por nombre.
- 🗂️ Filtro por **región** y **tipo**.
- 📋 Vista de detalles: imagen oficial, altura, peso, tipos y estadísticas base.
- 🌙 Tema oscuro integrado para mayor confort visual.
- 👥 Pantalla informativa con los desarrolladores del proyecto.

---

## 📱 Instalación de la App

### Opción 1: Ejecutar desde código fuente

1. **Clona el repositorio**
```bash
git clone https://github.com/tuusuario/apixmon.git
cd apixmon
```

2. **Instala las dependencias**
```bash
flutter pub get
```

3. **Ejecuta la app en modo debug**
```bash
flutter run
```
---

### Opción 2: Instalar el APK en tu dispositivo

1. Asegúrate de tener activada la **instalación desde fuentes desconocidas** en tu dispositivo Android.
2. Copia el archivo `ApixMon.apk` (ubicado en `(https://github.com/CHR-35/ApixMon/raw/main/ApixMon.apk`) a tu celular.
3. Abre el archivo desde tu explorador de archivos y confirma la instalación.

---

## 🧱 Estructura del Proyecto

```
lib/
├── models/               # Modelos de datos desde la API
├── providers/            # Lógica de negocio y estado (Provider)
├── screens/              # Pantallas principales (Home, Detalles, Info)
├── utils/                # Utilidades, temas, rutas, constantes
├── widgets/              # Widgets personalizados reutilizables
└── main.dart             # Punto de entrada de la app
```

---

## 🛠 Tecnologías Usadas

- Flutter 3.x
- Dart
- PokeAPI
- Provider (gestión de estado)
- Material Design + tema oscuro personalizado

---

## 👤 Autores

- **Christopher Balkaran**  
  _Desarrollador principal_  
  Estudiante de Ingeniería en Sistemas - UNIMAR  

- **Jeremy Ferrer**  
  _Encargado de diseño visual, experiencia de usuario y lógica de estructura_  

---
