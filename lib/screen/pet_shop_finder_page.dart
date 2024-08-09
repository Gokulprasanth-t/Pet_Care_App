import 'package:flutter/material.dart';

class PetShopFinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Shop Finder', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.grey[100], // Pleasant background color
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          PetShopItem(
            shopName: 'Parrot Paradise',
            productImageURL: 'https://as1.ftcdn.net/v2/jpg/02/72/92/40/1000_F_272924092_IhPcJtGqD3cHcomwtGqAsZ34GgNENkYW.jpg',
            productDetails: 'Product Details: Colorful and talkative parrots.',
            location: '1234 Main St, City, Country',
            phoneNumber: '+1234567890',
          ),
          SizedBox(height: 16.0),
          PetShopItem(
            shopName: 'Fish Frenzy',
            productImageURL: 'https://as1.ftcdn.net/v2/jpg/06/00/98/62/1000_F_600986226_vZqxpraF9mTn0RZdOD8TgDOVMtAR21uZ.jpg',
            productDetails: 'Product Details: Exotic and vibrant fish varieties.',
            location: '5678 Elm St, City, Country',
            phoneNumber: '+0987654321',
          ),
          SizedBox(height: 16.0),
          PetShopItem(
            shopName: 'Cat Kingdom',
            productImageURL: 'https://as2.ftcdn.net/v2/jpg/03/12/84/89/1000_F_312848906_cxG09JQbnzeJgQqx6wEpV0I6BLPrDftg.jpg',
            productDetails: 'Product Details: Friendly and playful cats.',
            location: '2468 Pine St, City, Country',
            phoneNumber: '+1357924680',
          ),
        ],
      ),
    );
  }
}

class PetShopItem extends StatelessWidget {
  final String shopName;
  final String productImageURL;
  final String productDetails;
  final String location;
  final String phoneNumber;

  const PetShopItem({
    required this.shopName,
    required this.productImageURL,
    required this.productDetails,
    required this.location,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent[100],
      elevation: 4.0,
      child: ListTile(
        leading: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Image.network(
            productImageURL,
            key: ValueKey<String>(productImageURL),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(shopName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productDetails),
            SizedBox(height: 8.0),
            Text('Location: $location'),
            Text('Phone: $phoneNumber'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetShopDetailPage(shopName: shopName)),
          );
        },
      ),
    );
  }
}

class PetShopDetailPage extends StatelessWidget {
  final String shopName;

  const PetShopDetailPage({
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.amberAccent[500],
      body: PetShopProductList(),
    );
  }
}

class PetShopProductList extends StatefulWidget {
  @override
  _PetShopProductListState createState() => _PetShopProductListState();
}

class _PetShopProductListState extends State<PetShopProductList> {
  final List<ProductItem> _products = [
    ProductItem(
      productName: 'Parrot Food',
      productImageURL: 'https://m.media-amazon.com/images/I/41vlTxXQD7L._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$10.99',
      discount: '15%',
    ),
    ProductItem(
      productName: 'Fish Tank',
      productImageURL: 'https://m.media-amazon.com/images/I/41UAyK8Z3OL._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$120.99',
      discount: '10%',
    ),
    ProductItem(
      productName: 'Dog Toys',
      productImageURL: 'https://m.media-amazon.com/images/I/41Zi5kqjxvL._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$8.99',
      discount: '20%',
    ),
    ProductItem(
      productName: 'Cat Scratcher',
      productImageURL: 'https://m.media-amazon.com/images/I/31+VGx6aOML._SY300_SX300_.jpg',
      price: '\$7.99',
      discount: '12%',
    ),
    ProductItem(
      productName: 'Fish Food',
      productImageURL: 'https://m.media-amazon.com/images/I/51tKS5G1O4L._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$3.99',
      discount: '8%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 10.0),
            ProductItem(
              productName: _products[index].productName,
              productImageURL: _products[index].productImageURL,
              price: _products[index].price,
              discount: _products[index].discount,
            ),
            // Space between product cards
          ],
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;
  final String productImageURL;
  final String price;
  final String discount;

  const ProductItem({
    required this.productName,
    required this.productImageURL,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[50],
      elevation: 4.0,
      child: ListTile(
        leading: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Image.network(
            productImageURL,
            key: ValueKey<String>(productImageURL),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: $price'),
            Text('Discount: $discount'),
          ],
        ),
        onTap: () {
          // Add functionality for tapping on a product
        },
      ),
    );
  }
}
