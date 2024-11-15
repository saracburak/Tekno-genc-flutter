import 'dart:async'; // Timer sınıfını import ettik
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher paketini import ettik
import '../components/order_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';
import 'login_page.dart'; // Giriş sayfasını import ettik
import '../service/auth.dart'; // Auth sınıfını ekledik

// Slider metinler için widget
class SliderText extends StatefulWidget {
  @override
  _SliderTextState createState() => _SliderTextState();
}

class _SliderTextState extends State<SliderText> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                'En Yeni Ürünlerimizi Keşfedin!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                'Özel Teklifler İçin Bizi Takip Edin!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    try {
      await Auth().signOut(); // Çıkış yapma fonksiyonunu çağırıyoruz
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginPage()), // Giriş sayfasına yönlendirme
      );
    } catch (e) {
      // Hata durumunda kullanıcıya bilgi verin ve hata detaylarını loglayın
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Çıkış yaparken hata: ${e.toString()}')),
      );
      print('Çıkış yaparken hata: ${e.toString()}');
    }
  }

  Future<void> _openMap() async {
    const url =
        'https://www.google.com/maps/search/?api=1&query=Bağcılar,İstanbul'; // Google Maps URL'si
    if (await canLaunch(url)) {
      await launch(url); // URL'yi aç
    } else {
      // URL açılamıyorsa kullanıcıya bilgi ver
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Maps açılamıyor')),
      );
      print('Google Maps açılamıyor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.grey[700],
            onPressed: _openMap, // Map açma fonksiyonunu çağırıyoruz
          ),
        ),
        title: Text(
          'Bağcılar, İstanbul',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: Icon(Icons.close), // Çarpı ikonunu kullanıyoruz
              color: Colors.grey,
              onPressed: _signOut, // Çıkış yapma işlemi
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 117, 117, 117),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.orange,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SliderText(), // SliderText widget'ı burada
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Ürünler",
              style: GoogleFonts.notoSerif(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  // GridView kaydırma işlevini aktif yap
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
