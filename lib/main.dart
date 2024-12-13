import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplikasi_pertamaku/drama_screen.dart';
import 'package:aplikasi_pertamaku/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // animasi splash screen
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const AboutMeScreen(),
    );

  }
}
class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});


  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 244, 243, 207)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          '✨ About Me ✨',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 3, 2, 12),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
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
                        'assets/foto.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                   gradient: LinearGradient(
                   colors: [Colors.blue, Color.fromARGB(255, 244, 243, 207)],
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
            ),
                  )
                ),
                ListTile(
                  leading: const Icon(Icons.home,color:Color.fromARGB(255, 15, 143, 223)),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.movie, color:Color.fromARGB(255, 41, 41, 39)),
                  title: const Text('Drama List'),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            childCurrent: this,
                            duration: const Duration(milliseconds: 400),
                            // reverseDuration: const Duration(milliseconds: 400),
                            child: const DramaScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.whatsapp, color:Color(0xFF25D366)),
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
                  leading: const Icon(FontAwesomeIcons.instagram, color:Color(0xFF8134AF)),
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
                ListTile(
                  leading: const Icon(FontAwesomeIcons.facebook, color:Color.fromARGB(255, 15, 91, 223)),
                  title: const Text('Facebook'),
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
                  'Informatics Engineering Student',
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 120, 119, 119)),
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
                         gradient: LinearGradient(
                          colors: [Color.fromARGB(255, 204, 215, 230), Color.fromARGB(255, 189, 227, 253)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Hello There👋✨\nMy name is Elis Setiyaningsih. I was born in Waelo on August 14, 2004, and I am currently a 5th-semester student at ITB Stikom Ambon. I am passionate about technology and am currently diving deeper into Flutter to explore its features and capabilities.\nIf you'd like to know more about me or discuss opportunities, feel free to contact me!",
                                speed: const Duration(milliseconds: 60),
                                textStyle: TextStyle(fontSize: 16, color: Colors.black),
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
              const SizedBox(height: 15),
               const SizedBox(height: 20),
               Container(
                padding: const EdgeInsets.all(15),
                width: 400,
                decoration: BoxDecoration(
                   gradient: LinearGradient(
                   colors:  [Color.fromARGB(255, 212, 229, 234), Color.fromARGB(255, 212, 229, 240)],
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                      "Skills I'm Developing 📚💻 ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:  Color.fromARGB(255, 12, 25, 211),
                      )
                        )
                      ]
                    ),
                    const SizedBox(height: 25),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                       _buildSkillChip("🐘 PHP", Color.fromARGB(255, 122, 180, 234)), 
                       _buildSkillChip("🌐 HTML", Color.fromARGB(255, 239, 247, 100)), 
                       _buildSkillChip("⚡ JavaScript", Color.fromARGB(255, 110, 172, 233)),
                       _buildSkillChip("🐍 Python", Color.fromARGB(255, 216, 215, 128)), 
                       _buildSkillChip("🎨 CSS", Color.fromARGB(255, 227, 240, 55)),
                       _buildSkillChip("📱 flutter", Color.fromARGB(255, 46, 133, 204)),
                      
                   ]
                    )
                      ]
                       )
               )
              ],
            )
            )
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
        fontSize: 13,
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