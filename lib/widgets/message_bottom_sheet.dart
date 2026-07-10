import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/whatsapp_service.dart';

class MessageBottomSheet {

  static Future<void> show(
    BuildContext context, {

    required String titulo,
    required String mensaje,
  }) async {

    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      builder: (_) {

        return Padding(
          padding:
              const EdgeInsets.all(24),

          child: Column(
            mainAxisSize:
                MainAxisSize.min,

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                titulo,

                style:
                    const TextStyle(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 250,

                child:
                    SingleChildScrollView(
                  child: Text(
                    mensaje,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [

                  Expanded(
                    child:
                        FilledButton.icon(
                      onPressed: () {

                        Clipboard
                            .setData(
                          ClipboardData(
                            text:
                                mensaje,
                          ),
                        );

                        Navigator.pop(
                            context);
                      },

                      icon:
                          const Icon(
                        Icons.copy,
                      ),

                      label:
                          const Text(
                        "Copiar",
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  Expanded(
                    child:
                        OutlinedButton.icon(
                      onPressed: () {

                        WhatsappService
                            .enviarMensaje(
                          mensaje,
                        );
                      },

                      icon:
                          const Icon(
                        Icons.chat,
                      ),

                      label:
                          const Text(
                        "WhatsApp",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}