# Tu Solution

Aplicación Flutter para la gestión local de un taller de reparación de celulares, tablets y laptops.

## Tecnologías
- Flutter / Dart
- Drift sobre SQLite
- Riverpod
- Arquitectura organizada por capas (base para MVVM)

## Requisitos
- Flutter SDK estable
- Android Studio o Android SDK
- Un emulador Android o dispositivo físico

## Preparar el proyecto
Este ZIP contiene el código fuente y la estructura Flutter. Si todavía no existe la carpeta de plataforma Android, ejecuta desde la raíz:

```bash
flutter create . --platforms=android
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

`flutter create .` genera los archivos de plataforma Android que dependen de la versión local de Flutter. No sobrescribe los archivos de `lib/`.

## Compilar APK
```bash
flutter build apk --release
```
El APK se genera en `build/app/outputs/flutter-apk/app-release.apk`.

## Estructura
- `lib/core`: tema y componentes comunes.
- `lib/data/database`: tablas y base de datos Drift.
- `lib/data/repositories`: acceso a datos.
- `lib/features`: vistas y viewmodels por módulo.
- `lib/providers`: proveedores de Riverpod.

## Estado de esta entrega
Es una base inicial funcional: base de datos local, entidades principales, repositorios, dashboard, listado/creación básica de órdenes y listado de inventario. Antes de entregar el examen deben completarse y probarse las operaciones de edición/eliminación, historial detallado, asignación avanzada, movimientos y devoluciones de inventario, validaciones y pruebas automatizadas. No se debe presentar este scaffold como implementación final completa.
