import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {

  final String titulo;
  final String preview;
  final VoidCallback onTap;

  const MessageCard({
    super.key,
    required this.titulo,
    required this.preview,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: InkWell(
        borderRadius:
            BorderRadius.circular(20),

        onTap: onTap,

        child: Padding(
          padding:
              const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                titulo,

                style:
                    const TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              Text(
                preview,

                maxLines: 2,

                overflow:
                    TextOverflow.ellipsis,

                style:
                    const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}