import 'package:flutter/material.dart';

void main() {
  runApp(my_inkwell());
}

class my_inkwell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Inkwell',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 69, 126),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              InkWellExample(
                description: 'คุกกี้เป็ดน้อย',
                imagePath: 'assets/pic1.png',
                text:
                    'คุกกี้รูปเป็ดสีเหลืองสดใส กรุบกรอบและมีรสหวานอ่อน ๆ ที่ทำจากเนยและน้ำตาล เป็นของว่างที่ได้รับความนิยมทั่วไปในหมู่ผู้ผจญภัยและนักเดินทาง มักถูกใช้เป็นเสบียงพกพาสำหรับภารกิจสั้น ๆ หรือใช้เป็นของว่างเพื่อเพิ่มพลังงานระหว่างการเดินทาง',
              ),
              InkWellExample(
                description: 'แพนเค้ก',
                imagePath: 'assets/pic2.png',
                text:
                    'วงกลมสีทองอร่ามที่ปรุงอย่างพิถีพิถันจากวัตถุดิบชั้นยอด: แป้งสาลีเนื้อละเอียด, นมสดจากวัววิเศษ, ไข่ที่เต็มไปด้วยพลังงานชีวิต และความหวานหอมจากน้ำผึ้งป่า เมื่อสัมผัสจะรู้สึกถึงความนุ่มฟูราวกับก้อนเมฆ และเมื่อกัดเข้าไปจะปลดปล่อยพลังงานอันอบอุ่นที่ซึมซาบไปทั่วร่างกาย มอบความกระปรี้กระเปร่าและฟื้นฟูจิตใจที่อ่อนล้า',
              ),
              InkWellExample(
                description: 'ช็อกโกแลตมัจฉะ',
                imagePath: 'assets/pic3.PNG',
                text:
                    'นี่คือ "มัทฉะช็อกโกแลต" ไอเทมที่ดูเรียบง่าย แต่มีคุณสมบัติพิเศษที่ผู้ช่ำชองเท่านั้นจะเข้าใจถึงแก่นแท้ของมัน มันคือการผสมผสานที่ลงตัวระหว่างพลังแห่งธรรมชาติสองขั้ว ทั้งความสงบเยือกเย็นของป่าไผ่ และความลึกล้ำร้อนแรงของเมล็ดโกโก้',
              ),
              InkWellExample(
                description: 'ข้าวกล่อง',
                imagePath: 'assets/pic4.png',
                text:
                    'กล่องอาหารที่ปรุงขึ้นด้วยความใส่ใจของมาสเตอร์เชฟในตำนาน แม้จะดูเรียบง่าย แต่ภายในบรรจุความอร่อยที่หลากหลายและทรงพลัง เมื่อเปิดออกจะเผยให้เห็นอาหารที่ถูกจัดวางอย่างเป็นระเบียบ ทั้งเนื้อสัตว์ชิ้นพอดีคำที่เคลือบด้วยซอสเข้มข้น ผักหลากสีสันที่คงความสดกรอบ และข้าวสวยเม็ดเรียวยาวที่หุงจนนุ่มฟู',
              ),
              InkWellExample(
                description: 'ลูกอมปริศนา',
                imagePath: 'assets/pic5.png',
                text:
                    'ลูกอมที่มีสีสันกลับหมุนเวียนและเปลี่ยนแปลงอยู่ตลอดเวลา ราวกับกักเก็บแสงจากดวงดาวและเงาจากราตรีเอาไว้ในชิ้นเดียว ไม่มีใครรู้ว่ารสชาติแท้จริงของมันเป็นอย่างไร เพราะทุกครั้งที่ลิ้นสัมผัส มันจะมอบรสชาติที่แตกต่างกันไป ไม่ว่าจะเป็นรสหวานของผลไม้จากดินแดนสวรรค์ รสเค็มของน้ำตาจากสัตว์อสูร หรือแม้แต่รสขมที่ยากจะลืมเลือน',
              ),
              InkWellExample(
                description: 'แพนจัง',
                imagePath: 'assets/pic6.png',
                text: 'เอ่อจูริ แพนจังหลุดออกมาจากห้องครัวอีกแล้วนะ',
              ),
              Column(
                children: const <Widget>[
                  Image(image: AssetImage('assets/harikitte ikkou.webp'), width: 100, height: 150),
                  Text(
                    'Harikitte Ikkou',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          
        ),
      ),
    );
  }
}

class InkWellExample extends StatefulWidget {
  const InkWellExample({
    super.key,
    required this.description,
    required this.imagePath,
    required this.text,
  });

  final String description;
  final String imagePath;
  final String text;

  @override
  State<InkWellExample> createState() => _InkWellExampleState();
}

class _InkWellExampleState extends State<InkWellExample> {
  double sideLength = 50;
  String get description => widget.description;
  String get imagePath => widget.imagePath;
  String get text => widget.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: Text(description),
                    content: Text(text),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
            );
          },
          child: Image(
            image: AssetImage(imagePath),
            width: 125,
            height: 125,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(description, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
