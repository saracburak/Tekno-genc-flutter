import 'package:flutter/material.dart';

class CreditCardPage extends StatefulWidget {
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Ödeme Yap',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kart Bilgileri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _cardNumberController,
              labelText: 'Kart Numarası',
              hintText: '0000 0000 0000 0000',
              icon: Icons.credit_card,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _expiryDateController,
                    labelText: 'Son Kullanma Tarihi',
                    hintText: 'AA/YY',
                    icon: Icons.date_range,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: _cvvController,
                    labelText: 'CVV',
                    hintText: '123',
                    icon: Icons.lock,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _cardHolderNameController,
              labelText: 'Kart Sahibi Adı',
              hintText: 'Ad Soyad',
              icon: Icons.person,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // Ödeme işlemi kodu buraya eklenebilir
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ödeme işlemi gerçekleştirildi!'),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Ödemeyi Tamamla',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
