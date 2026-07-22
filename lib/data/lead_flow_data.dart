import 'package:flutter/material.dart';

import '../models/flow_node.dart';

const clienteColor = Color(0xFF2475E9);
const interesColor = Color(0xFF087A4A);
const manejoColor = Color(0xFF7450E8);
const condicionColor = Color(0xFF8A6A45);
const seguimientoColor = Color(0xFFF4A300);
const agendadoColor = Color(0xFFE64500);

final List<FlowNode> flowNodes = [
  FlowNode(
    id: 'mensaje',
    titulo: 'MENSAJE\nENTRANTE',
    descripcion:
        'El proceso comienza cuando una persona interesada envía un mensaje. Identifica el motivo de contacto y responde con rapidez para mantener su interés.',
    posicion: const Offset(18, 82),
    size: const Size(150, 70),
    tipo: FlowNodeType.accion,
    color: clienteColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/mensaje_entrante.png',
  ),
  FlowNode(
    id: 'fuentes',
    titulo: 'Origen del contacto',
    descripcion:
        'Identifica de dónde llegó el lead para entender qué información recibió antes de escribir y adaptar la conversación a su contexto.',
    elementos: const ['Campañas', 'Orgánicos', 'Formularios'],
    posicion: const Offset(18, 186),
    size: const Size(150, 124),
    tipo: FlowNodeType.informacion,
    color: clienteColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/fuentes.png',
  ),
  FlowNode(
    id: 'llamada',
    titulo: 'LLAMADA\nORGÁNICA',
    descripcion:
        'La persona llama por iniciativa propia. Escucha su necesidad, registra sus datos y determina qué tan urgente es su caso antes de orientarla.',
    posicion: const Offset(18, 350),
    size: const Size(150, 70),
    tipo: FlowNodeType.accion,
    color: clienteColor,
    mostrarReferencia: false,
  ),
  FlowNode(
    id: 'inmediata',
    etiqueta: 'INMEDIATA',
    titulo: 'Necesita atención urgente',
    descripcion:
        'La persona expresa dolor intenso o una necesidad urgente. Prioriza una respuesta empática y busca ofrecerle la cita disponible más cercana.',
    elementos: const [
      'Solicita atención inmediata',
      'Expresa que no soporta el dolor',
    ],
    posicion: const Offset(230, 108),
    size: const Size(150, 120),
    tipo: FlowNodeType.informacion,
    color: interesColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/inmediata.png',
  ),
  FlowNode(
    id: 'ignorancia',
    etiqueta: 'IGNORANCIA',
    titulo: 'Necesita información',
    descripcion:
        'La persona aún no conoce bien el servicio y hace preguntas generales. Aclara sus dudas antes de invitarla a dar el siguiente paso.',
    elementos: const [
      'Pregunta por el precio',
      'Pregunta qué es',
      'Solicita información',
    ],
    posicion: const Offset(230, 286),
    size: const Size(150, 118),
    tipo: FlowNodeType.informacion,
    color: interesColor,
  ),
  FlowNode(
    id: 'opcional',
    etiqueta: 'Opcional',
    titulo: 'Está comparando opciones',
    descripcion:
        'La persona está explorando alternativas y todavía no decide. Comprende qué busca, explica las diferencias del tratamiento y relaciona sus beneficios con su necesidad.',
    elementos: const [
      'Probar algo natural',
      '¿Qué diferencia tiene con la medicina convencional?',
      'Está comparando opciones',
    ],
    posicion: const Offset(226, 466),
    size: const Size(158, 190),
    tipo: FlowNodeType.informacion,
    color: interesColor,
  ),
  FlowNode(
    id: 'terminal',
    etiqueta: 'Terminal',
    titulo: 'Ya probó otros tratamientos',
    descripcion:
        'La persona llega frustrada porque otras alternativas no le funcionaron. Valida su experiencia y explica con honestidad cómo puede ayudarle este tratamiento.',
    elementos: const ['Probó varios tratamientos sin obtener resultados'],
    posicion: const Offset(230, 714),
    size: const Size(150, 115),
    tipo: FlowNodeType.informacion,
    color: interesColor,
  ),
  FlowNode(
    id: 'encaminar',
    titulo: 'Proponer una cita cercana',
    descripcion:
        'Después de entender la necesidad, guía la conversación hacia una fecha concreta para evitar que el interés se enfríe.',
    objetivo:
        'Lograr que el lead agende su cita el mismo día o dentro de la semana.',
    acciones: const [
      'Responder rápidamente',
      'Mostrar disponibilidad',
      'Enviar beneficios y tratamiento recomendado',
    ],
    posicion: const Offset(446, 108),
    size: const Size(145, 120),
    tipo: FlowNodeType.informacion,
    color: manejoColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/encasillar.png',
  ),
  FlowNode(
    id: 'brindar',
    titulo: 'Orientar antes de agendar',
    descripcion:
        'Si la persona necesita más claridad, utiliza preguntas del método SPIN para comprender su situación y presenta el tratamiento y sus beneficios de forma personalizada.',
    elementos: const [
      'Brindar información relevante',
      'Aplicar el método SPIN',
    ],
    posicion: const Offset(446, 286),
    size: const Size(145, 118),
    tipo: FlowNodeType.informacion,
    color: manejoColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/brindar.png',
  ),
  FlowNode(
    id: 'lead_dificil',
    etiqueta: 'Lead difícil',
    titulo: 'Complementos de cortesía',
    descripcion:
        'Cuando el lead presenta más objeciones, refuerza el valor de la propuesta con un complemento de cortesía adecuado, sin desviar la conversación del tratamiento principal.',
    leyenda: const [
      FlowLegendItem('Nutrición', Color(0xFF10A33A)),
      FlowLegendItem('Masaje relajante', Color(0xFFFF493D)),
      FlowLegendItem('Auriculoterapia', Color(0xFF2F72D2)),
      FlowLegendItem('Ventosas', Color(0xFF9C31E8)),
    ],
    posicion: const Offset(430, 470),
    size: const Size(175, 260),
    tipo: FlowNodeType.imagen,
    color: manejoColor,
    mostrarReferencia: false,
  ),
  FlowNode(
    id: 'agenda',
    titulo: '¿Agenda cita?',
    descripcion:
        'Pregunta de forma directa si la persona desea reservar. Si acepta, confirma sus datos; si aún no, identifica la objeción que le impide avanzar.',
    posicion: const Offset(674, 104),
    size: const Size(150, 150),
    tipo: FlowNodeType.decision,
    color: condicionColor,
    mostrarReferencia: false,
  ),
  FlowNode(
    id: 'porque',
    titulo: '¿Por qué?',
    descripcion:
        'La persona no aceptó agendar. Pregunta con empatía qué duda, temor o condición le impide hacerlo para responder a la causa real.',
    posicion: const Offset(674, 292),
    size: const Size(150, 150),
    tipo: FlowNodeType.decision,
    color: condicionColor,
    mostrarReferencia: false,
  ),
  FlowNode(
    id: 'respondio',
    titulo: '¿Respondió?',
    descripcion:
        'Comprueba si la persona respondió al seguimiento y si compartió información suficiente para continuar con una conversación personalizada.',
    posicion: const Offset(674, 486),
    size: const Size(150, 150),
    tipo: FlowNodeType.decision,
    color: condicionColor,
    mostrarReferencia: false,
  ),
  FlowNode(
    id: 'respuesta_inmediata',
    titulo: 'Responder la objeción de inmediato',
    descripcion:
        'Responde en el momento a la duda u objeción identificada. Usa un mensaje claro, empático y relacionado con lo que la persona acaba de expresar.',
    posicion: const Offset(938, 292),
    size: const Size(150, 150),
    tipo: FlowNodeType.decision,
    color: seguimientoColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/respuesta.png',
  ),
  FlowNode(
    id: 'mensaje_personalizado',
    titulo: 'Mensaje personalizado',
    descripcion:
        'Retoma la conversación mencionando la necesidad, duda o dato que compartió la persona. Evita mensajes genéricos y propón un siguiente paso concreto.',
    posicion: const Offset(938, 488),
    size: const Size(150, 150),
    tipo: FlowNodeType.decision,
    color: seguimientoColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/personalizado.png',
  ),
  FlowNode(
    id: 'mensaje_contexto',
    titulo: 'Seguimiento',
    descripcion:
        'Si no hubo respuesta, vuelve a contactar con un mensaje breve y útil. Recuerda el motivo de su consulta, aporta valor y deja abierta una forma sencilla de responder.',
    posicion: const Offset(938, 700),
    size: const Size(150, 150),
    tipo: FlowNodeType.decision,
    color: seguimientoColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/contexto.png',
  ),
  FlowNode(
    id: 'confirmacion',
    titulo: 'Registrar y confirmar la cita',
    descripcion:
        'Registra nombre, teléfono, fecha, hora y servicio acordado. Después envía una confirmación clara para que la persona sepa cuándo y cómo será atendida.',
    posicion: const Offset(1190, 108),
    size: const Size(145, 120),
    tipo: FlowNodeType.informacion,
    color: agendadoColor,
    mostrarReferencia: true,
    referenciaImagen: 'assets/referencias/agendado.png',
  ),
];

const List<FlowConnection> flowConnections = [
  FlowConnection(
    desde: 'mensaje',
    hacia: 'fuentes',
    descripcion:
        'El mensaje entrante se clasifica según el canal por el que llegó el lead.',
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.top,
  ),
  FlowConnection(
    desde: 'fuentes',
    hacia: 'ignorancia',
    descripcion:
        'El lead solicita información general porque todavía no conoce bien el servicio.',
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.left,
    puntos: [Offset(90, 345), Offset(198, 345)],
  ),
  FlowConnection(
    desde: 'fuentes',
    hacia: 'inmediata',
    descripcion:
        'El contenido del mensaje muestra que la persona necesita atención urgente.',
    puntos: [Offset(198, 248), Offset(198, 168)],
  ),

  FlowConnection(
    desde: 'llamada',
    hacia: 'inmediata',
    descripcion:
        'Durante la llamada se detecta dolor intenso o una necesidad de atención inmediata.',
    puntos: [Offset(198, 385), Offset(198, 168)],
  ),
  FlowConnection(
    desde: 'fuentes',
    hacia: 'opcional',
    descripcion:
        'El lead está comparando alternativas antes de elegir un tratamiento.',
    puntos: [Offset(198, 248), Offset(198, 345)],
  ),
  FlowConnection(
    desde: 'fuentes',
    hacia: 'terminal',
    descripcion:
        'El lead indica que ya probó otros tratamientos sin obtener resultados.',
    puntos: [Offset(198, 248), Offset(198, 345)],
  ),
  FlowConnection(
    desde: 'inmediata',
    hacia: 'encaminar',
    descripcion:
        'Debido a la urgencia, se propone una fecha cercana para atender a la persona.',
  ),
  FlowConnection(
    desde: 'encaminar',
    hacia: 'agenda',
    descripcion:
        'Después de presentar disponibilidad y beneficios, se solicita una decisión de agenda.',
    color: clienteColor,
  ),
  FlowConnection(
    desde: 'brindar',
    hacia: 'agenda',
    descripcion:
        'Una vez resueltas las dudas con información personalizada, se vuelve a proponer la cita.',
    color: clienteColor,
    salida: FlowAnchor.top,
    entrada: FlowAnchor.left,
    puntos: [Offset(518, 260), Offset(650, 260), Offset(650, 179)],
  ),
  FlowConnection(
    desde: 'agenda',
    hacia: 'confirmacion',
    etiqueta: 'Sí',
    descripcion:
        'La persona acepta reservar; se registran sus datos y se confirma la cita.',
    color: Color(0xFF078121),
    posicionEtiqueta: Offset(1054, 173),
  ),
  FlowConnection(
    desde: 'agenda',
    hacia: 'porque',
    etiqueta: 'No',
    descripcion:
        'La persona no desea agendar todavía; se investiga la razón antes de continuar.',
    color: Color(0xFFE01C1C),
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.top,
    posicionEtiqueta: Offset(749, 273),
  ),
  FlowConnection(
    desde: 'porque',
    hacia: 'respuesta_inmediata',
    etiqueta: 'Explica su objeción',
    descripcion:
        'La persona explica qué le impide agendar y se prepara una respuesta inmediata a esa objeción.',
    posicionEtiqueta: Offset(884, 340),
  ),
  FlowConnection(
    desde: 'porque',
    hacia: 'respondio',
    etiqueta: 'No responde',
    descripcion:
        'La persona no explica por qué no agenda; se verifica si respondió a los mensajes posteriores.',
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.top,
    posicionEtiqueta: Offset(748, 465),
  ),
  FlowConnection(
    desde: 'agenda',
    hacia: 'respuesta_inmediata',
    etiqueta: 'Presenta una duda',
    descripcion:
        'Al hablar de la cita surge una duda concreta que debe resolverse en el momento.',
    color: clienteColor,
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.top,
    puntos: [Offset(749, 270), Offset(1013, 270)],
    posicionEtiqueta: Offset(885, 270),
  ),
  FlowConnection(
    desde: 'respuesta_inmediata',
    hacia: 'mensaje_personalizado',
    etiqueta: 'Continuar conversación',
    descripcion:
        'Tras responder la objeción, se continúa con un mensaje adaptado al contexto del lead.',
    color: clienteColor,
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.top,
    posicionEtiqueta: Offset(1090, 433),
  ),
  FlowConnection(
    desde: 'respondio',
    hacia: 'mensaje_personalizado',
    etiqueta: 'Con datos',
    descripcion:
        'El lead respondió y compartió información útil; el siguiente mensaje se personaliza con esos datos.',
    posicionEtiqueta: Offset(880, 560),
  ),
  FlowConnection(
    desde: 'mensaje_personalizado',
    hacia: 'mensaje_contexto',
    etiqueta: 'No contestó',
    descripcion:
        'La persona no respondió al mensaje personalizado; se programa un seguimiento contextual.',
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.top,
    posicionEtiqueta: Offset(1013, 674),
  ),
  FlowConnection(
    desde: 'respondio',
    hacia: 'mensaje_contexto',
    etiqueta: 'Sin datos',
    descripcion:
        'Hubo una respuesta, pero no contiene datos suficientes; se envía un mensaje que recupere el contexto.',
    puntos: [Offset(860, 561), Offset(860, 775)],
    posicionEtiqueta: Offset(866, 748),
  ),
  FlowConnection(
    desde: 'mensaje_contexto',
    hacia: 'respondio',
    etiqueta: 'No contestó',
    descripcion:
        'Después del seguimiento se vuelve a comprobar si la persona respondió y aportó información.',
    salida: FlowAnchor.bottom,
    entrada: FlowAnchor.left,
    puntos: [Offset(1013, 866), Offset(635, 866), Offset(635, 561)],
    posicionEtiqueta: Offset(754, 866),
  ),
  FlowConnection(
    desde: 'mensaje_personalizado',
    hacia: 'respuesta_inmediata',
    descripcion:
        'Si el mensaje personalizado genera una nueva duda u objeción, se responde de inmediato y se mantiene activa la conversación.',
    color: clienteColor,
    salida: FlowAnchor.right,
    entrada: FlowAnchor.right,
    puntos: [Offset(1148, 563), Offset(1148, 367)],
  ),
];
