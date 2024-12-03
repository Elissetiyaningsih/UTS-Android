import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplikasi_pertamaku/manga_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor:Colors.blue.shade400,
            centerTitle: true,
            title: const Text(
              'About Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Elis Setiyaningsih',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text('elissetiyaningsih@hotmail.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/logo.png',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.qeMWmF3YwfMgnTzqLoYIlQHaEK?rs=1&pid=ImgDetMain'))),
                ),
                ListTile(
                  leading: const Icon(Icons.home,color:Color.fromARGB(255, 15, 143, 223)),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.movie, color:Color.fromARGB(255, 15, 143, 223)),
                  title: const Text('Movie List'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MangaScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.whatsapp, color:Color.fromARGB(255, 15, 143, 223)),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6282188502609?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.instagram, color:Color.fromARGB(255, 15, 143, 223)),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://insta.me/elissetiyaningsih_?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color:Colors.red),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to get out?'),
                          actions: [
                            TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  SystemNavigator.pop();
                                }),
                          ]),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const AnimatedLogo(), 
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Elis Setiyaningsih',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'University Student',
                  style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Hello There!\nI'm Elis Setiyaningsih I was born in Waelo 14 August 2004, I am a 5th-semester Student at ITB Stikom Ambon. Currently, I am learning about the flutter and exploring its capabilities. If you want to know more about me, you can contact me.",
                                speed: const Duration(milliseconds: 60),
                                textStyle: TextStyle(fontSize: 17, color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                             totalRepeatCount: 1,
                             displayFullTextOnTap: true,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(15),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text(
                    "Contact Me:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                       color: Color.fromARGB(255, 46, 46, 47),
                    )
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.blue),
                        const SizedBox(width: 10),
                        const Text("elissetiyaningsih@hotmail.com"),
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.green),
                        const SizedBox(width: 10),
                        const Text("+62 821 8850 2609"),
                      ]
                    )
                  ],
                ),
              ),
               const SizedBox(height: 15),
               Container(
                padding: const EdgeInsets.all(15),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                      "Skills and expertise I'm learning",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 50, 50),
                      )
                        )
                      ]
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildSkillChip("Php", Color.fromARGB(255, 113, 191, 254)),
                        _buildSkillChip("html",  Color.fromARGB(255, 113, 191, 254)),
                        _buildSkillChip("Python",  Color.fromARGB(255, 113, 191, 254)),
                        _buildSkillChip("Javascript",  Color.fromARGB(255, 113, 191, 254)),
                       ]
                    )
                      ]
                       )
               )
              ],
            )
            )
          );
      }),
    );
  }
}
Widget _buildSkillChip(String label, Color backgroundColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});
  
  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();

}
class _AnimatedLogoState extends State<AnimatedLogo>{
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
     duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              // Menambahkan border tipis agar terlihat lebih bagus
              border: Border.all(
                color: Color.fromARGB(255, 26, 151, 240),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/foto.jpg',
                width: 150,
                height: 150, // Menambahkan height agar gambar tetap persegi
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 

