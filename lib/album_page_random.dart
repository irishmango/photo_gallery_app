import 'package:flutter/material.dart';

class AlbumPageRandom extends StatefulWidget {
  const AlbumPageRandom({super.key});

  @override
  State<AlbumPageRandom> createState() => _AlbumPageRandomState();
}

class _AlbumPageRandomState extends State<AlbumPageRandom> {

  List<int> imagesNumber = List.generate(25, (index) => index);

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
                      itemCount: imagesNumber.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Hero(
                            tag: 'image_$index',
                            child: Image.network('https://picsum.photos/id/$index/800/600')
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
          itemCount: imagesNumber.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5), 
          itemBuilder: (context, index) {
            final imgIndex = imagesNumber[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                child: Hero(
                  tag: 'image_$imgIndex',
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/id/$imgIndex/200/200'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showImage(context, imgIndex);
                },
              ),
            );
          }
        
          ),
      ),
    );
      
  }
}
//