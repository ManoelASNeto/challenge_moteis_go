import 'package:flutter/material.dart';

class MorePhotos extends StatelessWidget {
  const MorePhotos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final photos = (args?['photos'] as List<dynamic>?)?.cast<String>() ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos'),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              photos[index],
            ),
          );
        },
      ),
    );
  }
}


//suite.map((suite) => Image.network('${suite.periods}')).toList()