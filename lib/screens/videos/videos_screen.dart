import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/videos_data.dart';
import '../../models/video_model.dart';
import '../../providers/videos_provider.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/video_card.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideosProvider(),

      child: Scaffold(
        appBar: AppBar(title: const Text("VIDEOS")),

        body: Consumer<VideosProvider>(
          builder: (context, provider, child) {
            final categorias = [
              'Todas',
              ...{for (final video in videos) video.categoria},
            ];

            final filtrados = videos.where((v) {
              final coincideBusqueda = v.titulo.toLowerCase().contains(
                provider.busqueda.toLowerCase(),
              );
              final coincideCategoria =
                  provider.categoria == 'Todas' ||
                  v.categoria == provider.categoria;

              return coincideBusqueda && coincideCategoria;
            }).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),

                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),

                      hintText: "Buscar video",
                    ),

                    onChanged: provider.buscar,
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      for (
                        var index = 0;
                        index < categorias.length;
                        index++
                      ) ...[
                        if (index > 0) const SizedBox(width: 10),
                        CategoryChip(
                          text: categorias[index],
                          selected: provider.categoria == categorias[index],
                          onTap: () =>
                              provider.cambiarCategoria(categorias[index]),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 6),

                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),

                    itemCount: filtrados.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: .8,
                        ),

                    itemBuilder: (_, index) {
                      final VideoModel item = filtrados[index];

                      return VideoCard(
                        video: item,

                        onTap: () {
                          mostrarVideo(context, item);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> mostrarVideo(BuildContext context, VideoModel video) async {
    showDialog(
      context: context,

      builder: (_) {
        return AlertDialog(
          title: Text(video.titulo),

          content: SizedBox(
            width: 500,

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(video.descripcion),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () async {
                    await launchUrl(Uri.parse(video.url));
                  },

                  icon: const Icon(Icons.play_arrow),

                  label: const Text("Ver video"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
