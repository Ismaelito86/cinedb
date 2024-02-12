
# Movies App 🎬
Aplicación móvil desarrollada en Flutter para consultar información y trailers de películas populares, consumiendo la API TheMovieDB.

## Capturas de Pantalla
<div>
  <img src="movies.jpeg" width="200"/>
  <img src="movie_details.jpeg.jpeg" width="200"/>
  <img src="movies_list.jpeg.jpeg" width="200"/>
  <img src="profile.jpeg" width="200"/>
</div>

## Funcionalidades
Consulta el catálogo de películas populares, mejor valoradas y próximos estrenos
Ver detalle, reparto, trailers de cada película
Gestión de perfil de usuario
Guardar películas favoritas en la base de datos
y almacenamiento de imagenes con Firestore

## Arquitectura
- La arquitectura elegida para esta aplicación es arquitectura limpia, segregando las responsabilidades en tres capas:

<ul>
  <li>Domain: Aquí residen las entidades y reglas de negocio</li>
  <li>Infrastructure: Capa de acceso a datos, comunicación con API REST y Base de datos</li>
  <li>Presentation: Interfaz gráfica y lógica de presentación, gestor de estado, etc.</li>
</ul>

Esta separación facilita el mantenimiento y la escalabilidad del software y favorece el bajo acoplamiento entre capas.

- Por otra parte, he decidido usar Provider como gestor de estado dada su facilidad de integración y simpleza, brindando a su vez buen performance a la app.

- También estoy usando getx para la inyección de dependencia

## Persistencia local de datos
Para la persistencia de datos local he optado por Isar NoSql DB por sus ventajas velocidad y rendimiento. A continuacion les comparto algunas metricas extraída del gestor de paquetes de dart puv.dev:

Benchmarks only give a rough idea of the performance of a database but as you can see, Isar NoSQL database is quite fast 😇

| <img src="https://raw.githubusercontent.com/isar/isar/main/.github/assets/benchmarks/insert.png" width="100%" /> | <img src="https://raw.githubusercontent.com/isar/isar/main/.github/assets/benchmarks/query.png" width="100%" /> |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| <img src="https://raw.githubusercontent.com/isar/isar/main/.github/assets/benchmarks/update.png" width="100%" /> | <img src="https://raw.githubusercontent.com/isar/isar/main/.github/assets/benchmarks/size.png" width="100%" />  |

If you are interested in more benchmarks or want to check how Isar performs on your device you can run the [benchmarks](https://github.com/isar/isar_benchmark) yourself.


## Dependencias utilizadas
- dio
- get
- provider
- path_provider
- cached_network_image
- isar
- isar_flutter_libs
- image_picker
- firebase_core
- firebase_storage

## Instalación
- Clonar repositorio
```
git clone https://github.com/Ismaelito86/cinedb
```
- Ejecutar flutter pub get para instalar dependencias
```
flutter pub get
```
-Ejecutar la app con flutter run
```
flutter run
```
