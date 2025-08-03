import 'package:flutter/material.dart';

void main() {
  runApp(const my_resume());
}

class my_resume extends StatelessWidget {
  const my_resume({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(          
          appBar: AppBar(
            backgroundColor: const Color(0xFF0A2647),
            foregroundColor: Colors.white,
            bottom: const TabBar(
                tabs: [
                Tab(
                  icon: Icon(Icons.account_box, color: Colors.white),
                  child: Text('Profile', style: TextStyle(color: Colors.white)),
                ),
                Tab(
                  icon: Icon(Icons.phone, color: Colors.white),
                  child: Text('Contact', style: TextStyle(color: Colors.white)),
                ),
                Tab(
                  icon: Icon(Icons.engineering, color: Colors.white),
                  child: Text('Ability', style: TextStyle(color: Colors.white)),
                ),
                Tab(
                  icon: Icon(Icons.school, color: Colors.white),
                  child: Text('Education', style: TextStyle(color: Colors.white)),
                ),
                Tab(
                  icon: Icon(Icons.sports_esports, color: Colors.white),
                  child: Text('Hobby', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            title: const Text('My Resume'),
          ),
          body: TabBarView(
            children: [
              tab1(),
              tab2(),
              tab3(),
              tab4(),
              tab5(),
            ],
          ),
        ),
      ),
    );
  }
}


// ========== Tab Widget Area ========== //

Widget tab1() {
  return const Center(
    child: Column(
      children: [
        SizedBox(height: 50),
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(height: 20),

        Text(
          'ข้อมูลส่วนตัว',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20),
        Text(
          ' นายพีรพล \tศิริวัฒน์ \n Perapon \t\tSiriwat',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          ' อายุ : 20 ปี \n วันเกิด : 14 ตุลาคม 2547 \n เพศ : ชาย\n เบอร์โทรศัพท์ : 0655354921 \n อีเมล : ',
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}

Widget tab2() {
  return const Center(
    child: Column(
      children: [
        SizedBox(height: 50),
        Text(
          'ข้อมูลการติดต่อ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          ' ที่อยู่ : 99/8 ต.ถลุงเหล็ก อ.โคกสำโรง จ.ลพบุรี 15120 \n เบอร์โทรศัพท์ : 0655354921 \n อีเมล : perapon.s@ku.th',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}

Widget tab3() {
  return const Center(
    child: Column(
      children: [
        SizedBox(height: 50),
        Text(
          'ความสามารถ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          ' - ภาษาอังกฤษ : พอใช้ \n - ภาษาไทย : ดีมาก \n - ภาษาเขียนโปรแกรม : C, C++, Python, Dart, Java, HTML, CSS, JavaScript \n - โปรแกรมที่ใช้ในการทำงาน : Microsoft Office, Adobe Photoshop',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Text(
          ' และแน่นอนความสามารถที่กล่าวมาข้างต้น ผมให้ AI gen มา 🫵😂👍',
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}

Widget tab4() {
  return const Center(
    child: Column(
      children: [
        SizedBox(height: 50),
        Text(
          'ระดับการศึกษา',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'ประถมศึกษา',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'โรงเรียนเมืองใหม่ (ชลอราษฎร์รังสฤษฏ์)',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Text(
          'มัธยมศึกษาตอนต้น',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'โรงเรียนวินิตศึกษา ในพระราชูปถัมภ์ฯ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Text(
          'มัธยมศึกษาตอนปลาย',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'โรงเรียนพิบูลวิทยาลัย',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Text(
          'ปริญญาตรี',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'คณะศิลปศาสตร์และวิทยาศาสตร์ สาขาวิชาเทคโนโลยีสารสนเทศ \nมหาวิทยาลัยเกษตรศาสตร์ วิทยาเขตกำแพงแสน',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}

Widget tab5() {
  return const Center(
    child: Column(
      children: [
        SizedBox(height: 50),
        Text(
          'งานอดิเรก',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          ' - เล่นเกม Rainbow Six Siege',
          style: TextStyle(fontSize: 18),
        ),
        Image(
          image: AssetImage('assets/images/r6s.png'),
          width: 500,
          height: 281.25,
        ),
        SizedBox(height: 20),
        Text(
          ' - เล่นเกม Blue Archive',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          ' - เล่นเกม Helldivers 2',
          style: TextStyle(fontSize: 18),
        ),
        Text(
        ' - ครับ มีแต่เล่นเกมจริงๆ 😂',
          style: TextStyle(fontSize: 18),
        ),
        Image(
          image: AssetImage('assets/images/Arisu_dance.gif'),
          width: 200,
          height: 294,
        ),
      ],
    ),
  );
}