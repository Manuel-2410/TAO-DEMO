# Checklist de Baseline TAO v1.0

## Inicio

- [ ] La aplicación inicia sin errores críticos.
- [ ] La pantalla inicial carga correctamente.
- [ ] El menú principal es accesible.
- [ ] No existen errores visuales evidentes.

## Navegación

- [ ] Todas las opciones del menú abren su pantalla.
- [ ] El botón regresar funciona.
- [ ] No existen pantallas sin salida.
- [ ] Las rutas funcionan en Flutter Web.
- [ ] La recarga del navegador no rompe la aplicación.

## Dashboard

- [ ] Todas las tarjetas son visibles.
- [ ] Las tarjetas responden al clic.
- [ ] Los efectos hover funcionan en web.
- [ ] El diseño se adapta al ancho disponible.

## Síntomas

- [ ] La lista carga correctamente.
- [ ] La búsqueda funciona.
- [ ] Los filtros funcionan.
- [ ] La información de cada síntoma es correcta.
- [ ] No existen registros vacíos.

## Videos

- [ ] Los videos se muestran correctamente.
- [ ] El enlace puede abrirse.
- [ ] El enlace puede copiarse.
- [ ] La categoría se muestra.
- [ ] La descripción es legible.

## Contenido

- [ ] No existen textos incompletos.
- [ ] No existen faltas ortográficas graves.
- [ ] Las imágenes cargan.
- [ ] Los enlaces son válidos.
- [ ] La información está autorizada por TAO.

## Diseño responsive

- [ ] Funciona en escritorio.
- [ ] Funciona en tablet.
- [ ] Funciona en celular.
- [ ] No existe overflow horizontal.
- [ ] Los textos no quedan cortados.

## Estado técnico

- [ ] `flutter analyze` no presenta errores críticos.
- [ ] `flutter test` puede ejecutarse.
- [ ] `flutter build web --release` termina correctamente.
- [ ] El repositorio está actualizado.
- [ ] La baseline tiene etiqueta en Git.