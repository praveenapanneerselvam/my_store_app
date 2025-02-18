import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import 'cart_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Antibiotic Solution',
      price: 1200,
      imageUrl: 'assets/images/antibiotic.jpeg',
      details: 'Used to treat bacterial infections.',
    ),
    Product(
      id: '2',
      name: 'Chemical Reagent Kit',
      price: 2500,
      imageUrl: 'assets/images/reagent_kit.jpg',
      details: 'Essential for laboratory testing.',
    ),
    Product(
      id: '3',
      name: 'Disinfectant Liquid',
      price: 800,
      imageUrl: 'assets/images/disinfectant.webp',
      details: 'Kills 99.9% of germs and bacteria.',
    ),
    Product(
      id: '4',
      name: 'Lab Glassware Set',
      price: 3200,
      imageUrl: 'assets/images/lab_glassware.webp',
      details: 'Includes beakers, test tubes, and flasks.',
    ),
    Product(
      id: '5',
      name: 'Sterile Syringes (Pack of 50)',
      price: 1500,
      imageUrl: 'assets/images/syringes.webp',
      details: 'Disposable syringes for medical use.',
    ),
    Product(
      id: '6',
      name: 'Hand Sanitizer (500ml)',
      price: 500,
      imageUrl: 'assets/images/sanitizer.jpeg',
      details: 'Kills bacteria and viruses effectively.',
    ),
    Product(
      id: '7',
      name: 'Medical Gloves (100 Pcs)',
      price: 1200,
      imageUrl: 'assets/images/gloves.jpeg',
      details: 'Latex-free, disposable gloves.',
    ),
    Product(
      id: '8',
      name: 'Face Masks (50 Pcs)',
      price: 800,
      imageUrl: 'assets/images/facemask.jpeg',
      details: 'Three-layer protection masks.',
    ),
    Product(
      id: '9',
      name: 'IV Fluid Set',
      price: 1800,
      imageUrl: 'assets/images/iv_fluid.jpeg',
      details: 'Used for intravenous administration.',
    ),
    Product(
      id: '10',
      name: 'Surgical Blades (Pack of 10)',
      price: 700,
      imageUrl: 'assets/images/blades.jpg',
      details: 'Sterile and disposable surgical blades.',
    ),
    Product(
      id: '11',
      name: 'pH Test Strips',
      price: 600,
      imageUrl: 'assets/images/strips.jpeg',
      details: 'For measuring acidity and alkalinity.',
    ),
    Product(
      id: '12',
      name: 'Blood Collection Tubes (50 Pcs)',
      price: 2300,
      imageUrl: 'assets/images/tube.jpeg',
      details: 'Used for blood sample collection.',
    ),
    Product(
      id: '13',
      name: 'Ethanol (99% Pure) 1L',
      price: 1600,
      imageUrl: 'assets/images/ethanol.jpeg',
      details: 'Used in lab experiments and cleaning.',
    ),
    Product(
      id: '15',
      name: 'Autoclave Machine',
      price: 45000,
      imageUrl: 'assets/images/auto.jpeg',
      details: 'Sterilizes medical instruments efficiently.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medical & Chemical Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 2 items per row
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.2, // Adjust the aspect ratio for better display
          ),
          itemBuilder: (ctx, index) {
            final product = products[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        product.imageUrl,
                        width: double.infinity,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          product.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '₹${product.price}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(product);

                            // Show a snackbar notification
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.name} added to cart!'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
      ),
    );
  }
}
