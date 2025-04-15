import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Card(
              color: Color(0xFF3B3B3B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 8,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  children: [
            
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 95, 93, 93), // or any color you like
                            width: 4.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 150,
                          backgroundImage: AssetImage('assets/img/ceol_and_shokri.JPG'), 
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Text below the avatar

                    const Text("Shokri Francis Raoof",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("Future Flutter Dev in Training",
                    style: TextStyle(fontSize: 12),),
                      SizedBox(height: 8,),
                    const Text(
                      'Shokri is an irish guy living in Berlin currently learning how to code in Dart/Flutter. He is developing an app to help people learn music theory and also a Pokédex. He also has a little 1 year old mini dachshund named Ceol("Music" in Irish)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )],
    );
  }
}