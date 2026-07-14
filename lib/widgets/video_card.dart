import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import '../models/video_model.dart';

class VideoCard extends StatelessWidget {
  final VideoModel video;
  final VoidCallback onTap;

  const VideoCard({
    super.key,
    required this.video,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(video.titulo),
                  const SizedBox(height: 10),
                  Chip(
                    label: Text(video.categoria),
                  ),
                  const SizedBox(height: 20),
                  Text(video.descripcion),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse(video.url),
                      );
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Ver Video"),
                  ),
                  const SizedBox(height: 10),

            OutlinedButton.icon(
              onPressed: () async {

                await Clipboard.setData(
                  ClipboardData(
                    text: video.url,
                  ),
                );

                if (context.mounted) {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(
                      content: Text(
                        "Enlace copiado al portapapeles",
                      ),
                      duration: Duration(seconds: 2),
                    ),

                  );

                }

              },

              icon: const Icon(Icons.copy),

              label: const Text(
                "Copiar enlace",
              ),
            ),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  video.miniatura,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(video.titulo),
                  const SizedBox(height: 5),
                  Chip(
                    label: Text(video.categoria),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
