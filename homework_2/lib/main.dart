
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('พีรพลพาณิช'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Column(
              children: const <Widget>[
                ImageSection(image: 'TitleImage.jpg'),
                TitleSection(
                  name: 'พีรพลพาณิชบริการ ไม่จำกัด มหาชน',
                  price: 'ขายทุกอย่างไม่ว่าจะเป็นของกิน ของใช้ ของเล่น และกระสุนปืน',
                ),
                ButtonSection(),
              ],
            ),
            Expanded(
              // อย่าถามว่ามาได้ไง เพราะผมไม่รู้
              child: GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 5,
                crossAxisCount: 2, // number of columns
                children: const <Widget>[
                  MultiElementSection(
                    name: 'เลย์',
                    image: 'image1.jpg',
                    price: '22฿',
                  ),
                  MultiElementSection(
                    name: 'โลตัส',
                    image: 'image2.jpg',
                    price: '20฿',
                  ),
                  MultiElementSection(
                    name: 'ไก่ย่าง',
                    image: 'image3.jpg',
                    price: '20฿',
                  ),
                  MultiElementSection(
                    name: 'ปูไทย',
                    image: 'image4.jpg',
                    price: '20฿',
                  ),
                  MultiElementSection(
                    name: 'M150',
                    image: 'image5.jpg',
                    price: '12฿',
                  ),
                  MultiElementSection(
                    name: 'C-Vitt',
                    image: 'image6.jpg',
                    price: '25฿',
                  ),
                  MultiElementSection(
                    name: 'เสริมสร้าง common sense ให้กับคนข้างๆ',
                    image: 'Common_Sense.png',
                    price: 'ฟรี จากพีรพลพาณิช',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// ========== Class Definitions Area ========== //

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 100, height: 100, fit: BoxFit.cover);
    // #end image-asset
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.price,
  });

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.only(left: 5),
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: _isFavorited
                ? const Icon(Icons.remove_shopping_cart)
                : const Icon(Icons.add_shopping_cart),
            color: Colors.black,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        ),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}



class MultiElementSection extends StatelessWidget {
  const MultiElementSection({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    });

  final String name;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageSection(image: image),
        TitleSection(name: name, price: price),
        const FavoriteWidget(),
      ],
    );
  }
}

