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
        child: Card(
          color: Color(0xFF3B3B3B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 8,
              margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'image_$index',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(item.imagePath, fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text("Date Taken: ${item.imageDate}", style: const TextStyle(color: Colors.white70)),
                    const SizedBox(height: 12),
                    Text("Description: ${item.imageDescription}", style: const TextStyle(color: Colors.white, fontSize: 16)),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}