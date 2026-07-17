# Roadmap Maestro TAO Enterprise

**Duración estimada:** 50 semanas  
**Inicio:** Julio de 2026  
**Modalidad:** Desarrollo incremental  
**Estado:** En planeación  
**Versión del documento:** 1.0  

## Objetivo

Planificar la evolución de TAO desde su versión actual en Flutter
hasta una plataforma clínica empresarial con CRM, agenda, pacientes,
tratamientos, administración, portal del paciente, seguridad,
documentación y despliegue profesional.

Actividad	Horas por semana
Estudio técnico	4
Desarrollo	8
Pruebas	2
Documentación	2
Revisión y planeación	1
Total sugerido	17 horas

No es obligatorio cumplir exactamente 17 horas. El rango aceptable será:

Mínimo: 10 horas.
Recomendado: 15 a 20 horas.
Intensivo: 25 horas o más.

## Política de tiempo

El avance se medirá por entregables terminados y no únicamente por horas.

Si una semana no puede completarse, sus tareas pasarán a la siguiente
sin comprometer la estabilidad de la aplicación.

No se iniciará un módulo nuevo si el módulo anterior contiene errores críticos.

## Fases
Fase	Semanas	Resultado principal
1. Migración y estabilización	1–8	App Flutter completamente estable
2. Arquitectura profesional	9–14	Proyecto organizado por módulos y capas
3. Persistencia y datos	15–20	Base de datos y modelos clínicos
4. Backend y seguridad	21–27	API, autenticación y sincronización
5. Agenda inteligente	28–32	Citas, disponibilidad y recordatorios
6. Administración	33–38	Ingresos, gastos, reportes y dashboard
7. Portal del paciente	39–44	Acceso privado para pacientes
8. Nivel empresarial	45–50	Pruebas, despliegue, seguridad y entrega

## Roadmap completo de las 50 semanas
# Fase 1 — Migración y estabilización
- Semana 1 — Auditoría del proyecto

Estudiar

Estructura de un proyecto Flutter.
Principios básicos de refactorización.
Uso profesional de Git.

Implementar

Revisar carpetas.
Revisar dependencias.
Identificar archivos duplicados.
Registrar errores actuales.
Verificar que todas las pantallas funcionen.

Entregables

Auditoría técnica.
Lista de errores.
Inventario de módulos.
Baseline estable.
- Semana 2 — Dart aplicado a TAO

Estudiar

Clases.
Constructores.
Null safety.
Enums.
Extensiones.
Colecciones.

Implementar

Revisar modelos existentes.
Eliminar propiedades ambiguas.
Tipar correctamente variables.
Crear enums cuando existan estados definidos.

Entregables

Modelos refactorizados.
Convenciones de Dart documentadas.
- Semana 3 — Navegación

Estudiar

Rutas.
Paso de argumentos.
Navegación anidada.
Navegación web y móvil.

Implementar

Centralizar la navegación.
Eliminar rutas repetidas.
Revisar botón atrás.
Revisar enlaces directos.

Entregables

Mapa de navegación.
Navegación estable.
- Semana 4 — Gestión de estado

Estudiar

ChangeNotifier.
Consumer.
Selector.
Separación entre UI y estado.

Implementar

Revisar Providers.
Eliminar lógica de negocio de pantallas.
Evitar reconstrucciones innecesarias.

Entregables

Inventario de Providers.
Providers con responsabilidad definida.
- Semana 5 — Formularios y validaciones

Estudiar

Form.
TextFormField.
Validaciones.
Manejo de errores.

Implementar

Estandarizar formularios.
Crear validadores reutilizables.
Mejorar mensajes de error.

Entregables

Sistema común de validaciones.
Formularios consistentes.
- Semana 6 — Diseño y animaciones

Estudiar

Material Design 3.
Animaciones implícitas.
Microinteracciones.
Accesibilidad básica.

Implementar

Transiciones.
Estados hover.
Modales.
Feedback visual.

Entregables

Interfaz más moderna.
Guía visual inicial.
- Semana 7 — Responsive Design

Estudiar

LayoutBuilder.
MediaQuery.
Breakpoints.
Diseño adaptable.

Implementar

Revisar celular.
Revisar tablet.
Revisar web.
Corregir desbordamientos.

Entregables

Matriz de compatibilidad visual.
Pantallas principales responsivas.
- Semana 8 — Estabilización de la versión actual

Implementar

Corregir errores pendientes.
Eliminar código muerto.
Aplicar lint.
Revisar rendimiento.
Terminar migración de MAUI.

Entregables

TAO v1.1 estable.
Documento de cierre de migración.
Demo funcional.
Fase 2 — Arquitectura profesional
- Semana 9 — Introducción a SOLID

Aplicar responsabilidad única y separación de responsabilidades.

- Semana 10 — Organización Feature First

Mover gradualmente los módulos a:

features/
  nombre_feature/
- Semana 11 — Capa Presentation

Separar pantallas, widgets, estado y controladores.

- Semana 12 — Capa Domain

Definir entidades, casos de uso e interfaces.

- Semana 13 — Capa Data

Crear repositorios, modelos y fuentes de datos.

- Semana 14 — Inyección de dependencias y cierre

Conectar capas sin acoplamiento directo.

Resultado de fase:

TAO v1.5 Arquitectura Profesional.
Proyecto organizado por features.
ADR actualizados.
Diagrama de arquitectura.

# Fase 3 — Persistencia y modelo de datos
- Semana 15 — Fundamentos de bases de datos
Entidades.
Relaciones.
Claves.
Normalización.
- Semana 16 — Modelo de pacientes
Paciente.
Contacto.
Historial.
Consentimientos.
- Semana 17 — Modelo de tratamientos
Tratamiento.
Sesión.
Asignación.
Evolución.
Semana 18 — Modelo de agenda
Cita.
Horario.
Sucursal.
Terapeuta.
Disponibilidad.
Semana 19 — Persistencia local
SQLite o almacenamiento local equivalente.
CRUD.
Migraciones.
Semana 20 — Pruebas e integridad de datos
Datos duplicados.
Restricciones.
Eliminación lógica.
Recuperación.

Resultado de fase:

Base de datos local funcional.
Diagrama entidad-relación.
TAO v2.0 Gestión Clínica Local.
Fase 4 — Backend y seguridad
Semana 21 — Diseño de API REST

Definir recursos, rutas y respuestas.

Semana 22 — Backend inicial

Crear proyecto backend y configuración de ambientes.

Semana 23 — PostgreSQL

Trasladar el modelo de datos al servidor.

Semana 24 — Autenticación
Login.
Contraseñas seguras.
Tokens.
Sesiones.
Semana 25 — Roles y permisos
Director.
Administrador.
Recepción.
Terapeuta.
Paciente.
Semana 26 — Sincronización Flutter–Backend

Conectar repositorios con la API.

Semana 27 — Seguridad y manejo de errores
HTTPS.
Logs.
Validaciones.
Errores controlados.

Resultado de fase:

API funcional.
Base de datos centralizada.
Usuarios y roles.
TAO v2.5 Conectado.
Fase 5 — Agenda inteligente
Semana 28 — Calendario interno

Visualización diaria, semanal y mensual.

Semana 29 — Disponibilidad

Horarios, sucursales, terapeutas y bloqueos.

Semana 30 — Flujo de reservación

Crear, confirmar, reagendar y cancelar.

Semana 31 — Calendario del dispositivo

Agregar cita al calendario del teléfono.

Semana 32 — Recordatorios

Notificaciones, mensajes y confirmación de asistencia.

Resultado de fase:

Agenda funcional para las dos clínicas.
Flujo de citas documentado.
TAO v3.0 Agenda Inteligente.
Fase 6 — Administración y finanzas
Semana 33 — Catálogo financiero
Métodos de pago.
Conceptos.
Tratamientos.
Precios.
Semana 34 — Ingresos

Registrar cobros y abonos.

Semana 35 — Gastos

Registrar gastos operativos.

Semana 36 — Caja diaria

Apertura, movimientos y cierre.

Semana 37 — Dashboard

Indicadores principales.

Semana 38 — Reportes
PDF.
Excel.
Reportes por fecha, sucursal y tratamiento.

Resultado de fase:

Control financiero operativo.
Dashboard del director.
TAO v3.5 Administración.
Fase 7 — Portal del paciente
Semana 39 — Acceso del paciente

Login y recuperación de contraseña.

Semana 40 — Perfil y privacidad

El paciente solo podrá consultar su información.

Semana 41 — Citas

Ver, solicitar o cancelar citas según las reglas.

Semana 42 — Tratamientos

Consultar tratamiento asignado y progreso permitido.

Semana 43 — Contenido personalizado

Videos, recomendaciones y documentos.

Semana 44 — Notificaciones y pruebas

Recordatorios y validación de acceso.

Resultado de fase:

Portal privado del paciente.
Pruebas de aislamiento de información.
TAO v4.0 Portal Paciente.
Fase 8 — Nivel empresarial
Semana 45 — Pruebas automatizadas
Unitarias.
Widgets.
Integración.
Semana 46 — Auditoría de seguridad
Permisos.
Datos sensibles.
Sesiones.
Vulnerabilidades básicas.
Semana 47 — Respaldos y recuperación
Copias de seguridad.
Restauración.
Plan de contingencia.
Semana 48 — CI/CD y ambientes
Desarrollo.
Pruebas.
Producción.
Automatización de compilaciones.
Semana 49 — Distribución y capacitación
Web.
Android.
iOS, si se aprueba.
Capacitación.
Manuales.
Semana 50 — Cierre y entrega
Auditoría final.
Pruebas con usuarios.
Entrega comercial.
Roadmap posterior.
Retrospectiva completa.

Resultado final:

TAO Enterprise v5.0.
Plataforma documentada.
Aplicación desplegada.
Manual técnico.
Manual de usuario.
Manual de administración.
Plan de soporte.

# Hitos comerciales

## Hito 1 — Versión actual estabilizada

Semanas 1 a 8.

Resultado:
Aplicación Flutter completa, estable y presentable.

Valor comercial de referencia:
$25,000 MXN.

---

## Hito 2 — Gestión Clínica

Semanas 9 a 27.

Resultado:
Arquitectura profesional, pacientes, tratamientos,
base de datos, backend y usuarios.

La cotización de esta etapa deberá definirse por separado.

---

## Hito 3 — ERP Clínico TAO

Semanas 28 a 50.

Resultado:
Agenda, finanzas, portal paciente, reportes,
seguridad, despliegue y documentación final.

Esta será la etapa de mayor valor económico.

# Criterios de finalización de una fase

Una fase solo se considerará terminada cuando:

- Sus funciones principales estén implementadas.
- No existan errores críticos conocidos.
- Los flujos principales hayan sido probados.
- La documentación esté actualizada.
- El código esté respaldado en Git.
- Exista una versión demostrable.
- Se haya realizado una retrospectiva.

# Control general

| Semana | Tema | Estado | Horas | Entregable |
|---|---|---|---:|---|
| 1 | Auditoría | Pendiente | 0 | Informe técnico |
| 2 | Dart | Pendiente | 0 | Modelos revisados |
| 3 | Navegación | Pendiente | 0 | Router central |

# estados permitidos
Pendiente
En progreso
Bloqueada
En revisión
Terminada