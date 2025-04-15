import 'package:flutter/material.dart';
import 'package:photo_gallery_app/about_me_page.dart';
import 'package:photo_gallery_app/album_page.dart';
import 'package:photo_gallery_app/album_page_random.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> screens = [AlbumPage(), AlbumPageRandom(), AboutMePage(),
  ];

  int selectedIndex = 0;


  void addImageDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Center(child: const Text("'Add' Feature Coming Soon!")),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Dismiss", style: TextStyle(fontSize: 16, color: Colors.blue),),
              ),
            ),
          ],
        );
      },
    );
  }

  String getAppBarTitle(int index) {
  switch (index) {
    case 0:
      return 'My Photo Gallery';
    case 1:
      return 'Random Photo';
    case 2:
      return 'About Me';
    default:
    return "";
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getAppBarTitle(selectedIndex)),
        leading: selectedIndex == 0 || selectedIndex == 1
          ? InkWell(
          onTap: () {

            addImageDialog(context);
          },
          child: const Icon(Icons.add_a_photo, color: Colors.white),
        )
        : null,
        centerTitle: true,
      ),


      body: screens[selectedIndex],


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album_outlined),
            label: 'My Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh_outlined),
            label: 'Random',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'About Me',
          ),
        ],
      ),
          );
        }
      }