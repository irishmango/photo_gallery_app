import 'package:flutter/material.dart';
import 'package:photo_gallery_app/gallery_data.dart';

class PhotoDetailPage extends StatelessWidget {
  final GalleryItem item;
  final int index;

  const PhotoDetailPage({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(item.imageTitle),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'image_$index',
              child: Image.asset(item.imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 24),
            Text(item.imageDate, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item.imageDescription,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}