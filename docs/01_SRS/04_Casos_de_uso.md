## Usuarios

## Administrador del sistema
- Crear usuarios
- Configurar permisos
- Crear sucursales
- Administrar respaldos
- Actualizar sistemas


## Director 
- Consultar estadisticas
- Revisar ingresos
- Ver productividad 
- Adiminstracion 
- Configurar aplicacion
- Consultar reportes

## Recepcion
- Registrar pacientes
- Agendar citas
- Cobrar tratamientos
- Confirmar asistencia
- Buscar expedientes

## Terapeuta
- Consultar agenda
- Abrir expediente
- Regsitrar evolucion 
- Asignar tratamiento 
- Ver historial

## Paciente
- Agendar cita
- Consultar citas
- Ver citas en calendario movil
- ver videos
- Consultar historial
- Recordatorios 

# Casos de uso
## 01
Registrar paciente 
# usuario : recepcionista
- Descripcion : registrar paciente dentro del sistema 
- Flujo principal
- Resultado esperado
- Reglas : no permitir curp duplicada, no permitir telefono vacio 

Lista mínima
Pacientes

Registrar paciente

Editar paciente

Eliminar paciente

Buscar paciente

Ver historial

Agenda

Crear cita

Modificar cita

Cancelar cita

Confirmar cita

Recordatorio

Tratamientos

Crear tratamiento

Asignar tratamiento

Registrar sesión

Finalizar tratamiento

CRM

Registrar prospecto

Actualizar seguimiento

Cambiar estado

Registrar llamada

Finanzas

Registrar ingreso

Registrar gasto

Generar corte

Administración

Crear usuario

Editar usuario

Cambiar permisos

## hacer un diagrama de flujo para cada uno

## Prioridades

1. Prioridad alta: pacientes, agenda, tratamientos, crm
2. Prioridad Media: videos, estadisticas, dashboard
3. Prioridad baja : Configurarcion, temas, prfil 

## Identificador

CU-001

## Nombre

Registrar paciente

## Actor principal

Recepcionista

## Objetivo

Registrar la información inicial de un paciente.

## Precondiciones

La recepcionista inició sesión y tiene permisos.

## Flujo principal

1. Accede al módulo Pacientes.
2. Selecciona Nuevo paciente.
3. Captura los datos solicitados.
4. El sistema valida la información.
5. La recepcionista confirma el registro.
6. El sistema guarda el paciente.

## Flujos alternativos

- El teléfono ya está registrado.
- Falta información obligatoria.
- El sistema no tiene conexión.

## Resultado esperado

El paciente queda disponible para agenda y tratamientos.

## Prioridad

Alta.

## Estado

Planeado.