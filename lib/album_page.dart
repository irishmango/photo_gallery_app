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
  final pageController = PageController(
    initialPage: startIndex,
    viewportFraction: 0.85,
  );
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
                onTap: () {}, 
                child: SizedBox(
                  height: 400, 
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: galleryData.length,
                    itemBuilder: (context, index) {
                      final item = galleryData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Hero(
                          tag: 'image_$index',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GestureDetector(
                              onTap: () {
                                  Navigator.of(context).pop(); 
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => PhotoDetailPage(item: item, index: index),
                                    ),
                                  );
                                },
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
          ),
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