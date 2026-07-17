# Estado del Proyecto TAO Enterprise

**Versión actual:** v1.0 Baseline  
**Fase actual:** Sprint 0 finalizado  
**Estado general:** Preparado para auditoría técnica  
**Fecha de revisión:** ...

## Resumen

TAO dispone actualmente de una aplicación Flutter funcional que sirve como
plataforma de apoyo informativo y comercial.

Todavía no se encuentran implementados los módulos de base de datos,
autenticación, agenda clínica, pacientes, tratamientos, finanzas ni portal
del paciente.

## Fortalezas actuales

- Aplicación funcional.
- Identidad visual propia.
- Contenido organizado.
- Módulos informativos.
- Componentes reutilizables.
- Uso de Provider.
- Versión web demostrable.
- Base para crecimiento futuro.

## Limitaciones actuales

- La información no se almacena en una base de datos central.
- No existe autenticación.
- No existen roles ni permisos.
- No existe sincronización entre sucursales.
- No existe agenda operativa.
- No existe expediente digital.
- No existe control financiero.

## Próxima fase

Auditoría técnica de la aplicación Flutter actual.

| ID    | Riesgo                                    | Probabilidad | Impacto | Acción inicial                                 |
| ----- | ----------------------------------------- | ------------ | ------- | ---------------------------------------------- |
| R-001 | Pérdida de código durante refactorización | Media        | Alto    | Baseline, ramas y respaldos                    |
| R-002 | Crecimiento excesivo del alcance          | Alta         | Alto    | Mantener SRS y control de cambios              |
| R-003 | Falta de tiempo semanal                   | Media        | Medio   | Priorizar entregables esenciales               |
| R-004 | Seguridad insuficiente de datos           | Media        | Alto    | Diseñar permisos y backend antes de producción |
| R-005 | Inconsistencia entre dos sucursales       | Media        | Alto    | Base de datos centralizada                     |
| R-006 | Dependencia de una sola desarrolladora    | Alta         | Medio   | Documentación y código mantenible              |
| R-007 | Costos de servicios en la nube            | Media        | Medio   | Evaluar costos antes del despliegue            |
| R-008 | Rechazo de usuarios internos              | Media        | Alto    | Pruebas y capacitación progresiva              |
