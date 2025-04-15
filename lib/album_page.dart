import 'package:flutter/material.dart';
import 'package:photo_gallery_app/gallery_data.dart';
import 'package:photo_gallery_app/photo_detail_page.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  void showImage(BuildContext context, int startIndex) {
  final PageController pageController = PageController(
    initialPage: startIndex,
    viewportFraction: 0.85,
  );

  showDialog(
    context: context,
    barrierDismissible: true, // tap outside to dismiss
    builder: (_) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(), // dismiss on outside tap
        child: Container(
          color: Colors.black.withAlpha(50),
          child: Center(
            child: PageView.builder(
              controller: pageController,
              itemCount: galleryData.length,
              itemBuilder: (context, index) {
                final item = galleryData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Hero(
                    tag: 'image_$index',
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); 
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PhotoDetailPage(item: item, index: index),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              },
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

        child: GridView.builder(
          itemCount: galleryData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4), 
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                child: Hero(
                  tag: 'image_$index',
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(galleryData[index].imagePath),
                        fit: BoxFit.cover,
                        colorFilter: null
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showImage(context, index);
                },
               )   
               );
          }
            )
        ),
    );
  }
}