import 'package:flutter/material.dart';
import 'package:photo_gallery_app/gallery_data.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  void showImage(BuildContext context, int index) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Hero(
                tag: 'image_$index',
                child: Image.asset(
                  galleryData[index].imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void addImageDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return const AlertDialog(
          content: Text("Placeholder for adding an image."),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Photo Gallery",),
        leading: InkWell(
          onTap: () {
            addImageDialog(context);
          },
          child: const Icon(Icons.add_a_photo, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView.builder(
          itemCount: galleryData.length,
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 5,
          // ),
          itemBuilder: (context, index) {
            return Image.asset('assets/ceol/ceol_nemo.png', filterQuality: FilterQuality.high,);
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.photo_album_outlined, color: Colors.white, size: 36), label: "Photos"), 
          NavigationDestination(
              icon: Icon(Icons.refresh_outlined, color: Colors.white, size: 36), label: "Random"),
          NavigationDestination(
              icon: Icon(Icons.person_2_outlined, color: Colors.white, size: 36), label: "About Me",),
        ],
      ),
    );
  }
}