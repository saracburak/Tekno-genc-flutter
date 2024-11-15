import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.orange[50], // Arka plan rengini açık turuncu olarak ayarladık
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // İçerikleri ortaladık
          children: [
            // Başlık ve ikon
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons
                          .terrain_sharp, // Burada bir "T" harfi ikonu ekliyoruz
                      size: 50,
                      color: Colors.lightGreen,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'TEKNOGENÇ MARKET',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Büyük logo
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
              child: Image.asset(
                'lib/images/manav.png',
                height: 250, // Logo yüksekliği
                width: 250, // Logo genişliği
                fit: BoxFit
                    .cover, // Logo resmini kapsayıcı kutuya sığdırmak için
              ),
            ),

            // Ana başlık
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Organik market alışverişlerinizi kapınıza kadar getiriyoruz!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                  color: Color.fromARGB(255, 214, 79, 37),
                ),
              ),
            ),

            const SizedBox(
                height: 20), // Başlık ile açıklama arasına boşluk ekledik

            // Alt başlık
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Her gün taze ürünler TeknoGenç güvencesiyle.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange[700],
                ),
              ),
            ),

            const SizedBox(
                height: 40), // Açıklama ile buton arasına boşluk ekledik

            // Başla butonu
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors
                    .click, // button tıklanabilir hale getirir
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepOrange, // Buton rengi
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    "Hemen alışverişe başla!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Serif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(), // İçerikleri yukarıda tutmak için boşluk ekledik

            // Alt yazı
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'TeknoGenç Projesi öğrencileri Mehmet Görer ve Burak Saraç tarafından Doç. Dr. Önder Eyecioğlu tarafından verilen final projesi ödevi için yapılmıştır.  © Ağustos 2024 - Tüm Hakları Saklıdır.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
