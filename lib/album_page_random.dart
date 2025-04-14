import 'package:flutter/material.dart';

class AlbumPageRandom extends StatefulWidget {
  const AlbumPageRandom({super.key});

  @override
  State<AlbumPageRandom> createState() => _AlbumPageRandomState();
}

class _AlbumPageRandomState extends State<AlbumPageRandom> {

  List<int> imagesNumber = List.generate(100, (index) => index);

  void showImage(BuildContext context, int index) {
  showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (_) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(), 
        child: Container(
          color: Colors.black.withAlpha(85), 
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Hero(
                tag: 'image_$index',
                  child: Image.network('https://picsum.photos/id/$index/800/600',
                  fit: BoxFit.contain,
                ),
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
        return AlertDialog(
          title: Center(child: const Text("Add a new image?")),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    imagesNumber.add(imagesNumber.length);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("Add", style: TextStyle(fontSize: 16, color: Colors.blue),),
              ),
            ),
          ],
        );
      },
    );
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Photo Gallery", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
        leading: InkWell(
          onTap: () {
            addImageDialog(context);
          },
          child: Icon(Icons.add_a_photo, color: Colors.white),
          ),
        centerTitle: true,
      ),
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
      bottomNavigationBar: NavigationBar(
        destinations: [
        NavigationDestination(icon: Icon(Icons.photo_album_outlined, size: 36,), label: "Photos"),
        NavigationDestination(icon: Icon(Icons.refresh_outlined, size: 36,), label: "Random"),
        NavigationDestination(icon: Icon(Icons.person_2_outlined, size: 36,), label: "About Me")
        ]
        )

    );
      
  }
}
//