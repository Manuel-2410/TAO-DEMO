# Semana 1 – Auditoría Técnica

## Objetivo

Conocer con precisión el estado actual del código Flutter antes de
realizar cambios estructurales.

## Áreas a revisar

- Estructura de carpetas.
- Dependencias.
- Navegación.
- Providers.
- Models.
- Services.
- Widgets.
- Assets.
- Diseño responsive.
- Código duplicado.
- Errores de análisis.
- Pruebas.
- Configuración de plataformas.

## Entregables

- Inventario técnico.
- Mapa de módulos.
- Lista de deuda técnica.
- Matriz de prioridad.
- Plan de refactorización.


lib/data/cincoy10_data.dart
lib/data/contacto_inicial_data.dart
lib/data/lead_flow_data.dart
lib/data/seguimiento_data.dart
lib/data/sintomas_data.dart
lib/data/videos_data.dart
lib/data/zona_rio_data.dart
lib/main.dart
lib/models/agente.dart
lib/models/app_section.dart
lib/models/cita.dart
lib/models/cita_con_agente.dart
lib/models/flow_node.dart
lib/models/mensaje_model.dart
lib/models/puntos_totales_agente.dart
lib/models/sintoma.dart
lib/models/tratamiento.dart
lib/models/video_model.dart
lib/providers/app_provider.dart
lib/providers/clinica_provider.dart
lib/providers/flow_provider.dart
lib/providers/mensajes_provider.dart
lib/providers/navigation_provider.dart
lib/providers/sintomas_provider.dart
lib/providers/theme_provider.dart
lib/providers/videos_provider.dart
lib/screens/clinicas/cincoy10_screen.dart
lib/screens/clinicas/clinica_screen.dart
lib/screens/clinicas/zona_rio_screen.dart
lib/screens/diagnostico/sintomas_screen.dart
lib/screens/home/dashboard_content.dart
lib/screens/home/main_screen.dart
lib/screens/mensajes/contacto_inicial_screen.dart
lib/screens/mensajes/seguimiento_screen.dart
lib/screens/proceso_lead/proceso_lead_screen.dart
lib/screens/videos/videos_screen.dart
lib/services/api_service.dart
lib/services/data_service.dart
lib/services/whatsapp_service.dart
lib/theme/app_theme.dart
lib/utils/app_colors.dart
lib/utils/app_navigation.dart
lib/utils/app_routes.dart
lib/utils/constants.dart
lib/utils/responsive.dart
lib/widgets/app_sidebar.dart
lib/widgets/category_chip.dart
lib/widgets/content_area.dart
lib/widgets/custom_search.dart
lib/widgets/dashboard_card.dart
lib/widgets/decision_node.dart
lib/widgets/flow_connection_painter.dart
lib/widgets/flow_detail_panel.dart
lib/widgets/flow_group.dart
lib/widgets/flow_node_widget.dart
lib/widgets/menu_card.dart
lib/widgets/message_bottom_sheet.dart
lib/widgets/message_card.dart
lib/widgets/search_bar.dart
lib/widgets/section_title.dart
lib/widgets/sintoma_card.dart
lib/widgets/tratamiento_card.dart
lib/widgets/tratamiento_detail_card.dart
lib/widgets/video_card.dart

## Clasificar las carpetas
| Carpeta     | Propósito actual     | Estado    | Observación               |
| ----------- | -------------------- | --------- | ------------------------- |
| `screens`   | Contiene pantallas   | Revisar   | Mezcla varios módulos     |
| `widgets`   | Componentes visuales | Funcional | Necesita clasificación    |
| `models`    | Modelos de contenido | Funcional | Revisar tipado            |
| `providers` | Estado de la app     | Funcional | Revisar responsabilidades |
| `services`  | Servicios externos   | Revisar   | Verificar uso real        |

Estados permitidos:

Correcta.
Funcional con mejoras.
Desorganizada.
Duplicada.
Sin uso.
Pendiente de revisar.

