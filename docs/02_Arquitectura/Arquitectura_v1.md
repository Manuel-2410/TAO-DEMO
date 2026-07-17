TAO Enterprise será desarrollado bajo principios de escalabilidad,
mantenibilidad y reutilización.

Cada módulo deberá ser independiente del resto del sistema.

Cada nueva funcionalidad deberá integrarse sin modificar módulos ya existentes.

La arquitectura permitirá agregar nuevos módulos durante los próximos años sin necesidad de reescribir la aplicación.

## CAPAS
Presentation

Todo lo visual.

Pantallas.

Widgets.

Providers.

Controllers.

Domain

Aquí vive la lógica.

Casos de uso.

Interfaces.

Reglas.

Data

Base de datos.

API.

Modelos.

Repositorios.


## Flujo general
Usuario

↓

Flutter

↓

Provider

↓

Repository

↓

API

↓

Base de datos

## analisis de app
DashboardCard

↓

¿Debe vivir en Shared?

SI

-------

VideoCard

↓

Solo Videos

↓

Se queda en Videos

-------

DrawerMenu

↓

Toda la aplicación

↓

Shared

## Reglas del Código

Aquí quiero algo muy importante.

Estas reglas nunca podrán romperse.

Regla 1

Una pantalla no debe superar aproximadamente 300 líneas. Si crece demasiado, deberá dividirse en widgets reutilizables.

Regla 2

Un widget debe tener una sola responsabilidad.

Regla 3

No escribir lógica de negocio dentro de la UI.

Regla 4

No duplicar código.

Regla 5

Si un widget se usa más de dos veces, debe convertirse en un componente reutilizable.

Regla 6

Todo Provider deberá tener una responsabilidad clara.


## Arquitectura

| Elemento            | Estado                              |
| ------------------- | ----------------------------------- |
| Flutter             | Implementado                        |
| Provider            | Implementado                        |
| Navegación actual   | Implementada, pendiente de revisión |
| Feature First       | Planeado                            |
| Clean Architecture  | Planeado                            |
| Base de datos       | No implementada                     |
| Backend             | No implementado                     |
| Autenticación       | No implementada                     |
| Portal del paciente | No implementado                     |
