import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'main_spalsh_screen.dart';

void main() {
  runApp(MyHomePage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.pink, canvasColor: Colors.white),
      darkTheme:
          ThemeData(primarySwatch: Colors.red, canvasColor: Colors.black),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key, required this.title}) : super(key: key);

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _x = GlobalKey<ScaffoldState>();
  String str = 'Flutter Demo';
  int current = 0;
  List imgList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
  ];

  bool js = false;
  bool cSharp = false;
  bool python = false;

  //theme
  ThemeMode tm = ThemeMode.light;
  bool _swVal = false;

  /// variable
  int? _radioVlaue;
  String? result;
  Color? resultColor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: tm,
      theme: ThemeData(primarySwatch: Colors.pink, canvasColor: Colors.white),
      darkTheme:
          ThemeData(primarySwatch: Colors.red, canvasColor: Colors.black),
      home: Scaffold(
        key: _x,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: const [
                Icon(Icons.fire_extinguisher),
                Icon(Icons.water),
                Expanded(child: Icon(Icons.water)),
              ],
            ),
          ),
          actions: const [
            Icon(Icons.fire_extinguisher),
            Icon(Icons.water),
            Icon(Icons.fire_extinguisher),
            Icon(Icons.water),
          ],
          title: const Text(
            'Flutter',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(),
      ),
    );
  }

  ListView buildExpansionTile() {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ExpansionTile(
            backgroundColor: Colors.blueAccent,
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward),
            title: Text('#Account'),
            children: [
              Divider(color: Colors.grey),
              ListTile(
                title: Text('Sign Up'),
                subtitle: Text('Where You do live'),
                onTap: null,
              ),
              Card(
                child: ListTile(
                  title: Text('Sign In'),
                  subtitle: Text('Where You do live'),
                  onTap: null,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ExpansionTile(
          title: Text('#Information'),
          leading: Icon(Icons.info),
          children: [
            Divider(color: Colors.grey),
            ListTile(
              title: Text('Sign Up'),
              subtitle: Text('Where You do live'),
              onTap: null,
            ),
            ListTile(
              title: Text('Sign In'),
              subtitle: Text('Where You do live'),
              onTap: null,
            )
          ],
        ),
      ],
    );
  }

  Center buildThemeSwitch() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text('Light'),
          ),
          Switch(
            value: _swVal,
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.black,
            onChanged: (bool value) {
              setState(() {
                _swVal = value;
                if (_swVal == false) {
                  tm = ThemeMode.light;
                } else {
                  tm = ThemeMode.dark;
                }
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text('Dark'),
          ),
        ],
      ),
    );
  }

  RadioListTile<dynamic> buildRadioList(val, txt, subTxr) {
    return RadioListTile(
      value: val,
      groupValue: _radioVlaue,
      onChanged: (value) {
        setState(() {
          _radioVlaue = int.parse(value);
        });
      },
      title: const Text('txt'),
      subtitle: const Text('subTxr'),
    );
  }

  Column buildRadio() {
    return Column(
      children: [
        const Text(
          'Gess the aswer : 2+2',
          style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        buildRow(3, 'Wrong Answer', Colors.red),
        buildRow(4, 'Wright Answer', Colors.green),
        buildRow(5, 'Wrong Answer', Colors.red),
      ],
    );
  }

  myDialog() {
    var ad = AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text(
              '$result',
              style: TextStyle(color: resultColor),
            ),
            const Divider(),
            const Text('Answeris:4'),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (_) {
          return ad;
        });
  }

  Row buildRow(int p_value, String p_result, Color p_resultColor) {
    return Row(
      children: [
        Radio(
            value: p_value,
            groupValue: _radioVlaue,
            onChanged: (value) {
              setState(() {
                // _radioVlaue = value.toString();
                result = p_result;
                resultColor = p_resultColor;
                myDialog();
              });
            }),
        Text('$p_value'),
      ],
    );
  }

  ListView buildCarousel() {
    return ListView(
      children: [
        const SizedBox(height: 30),
        const Text(
          'Slider 1 : initial page index',
          style: TextStyle(color: Colors.amber),
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
            items: imgList.map((imgUrl) {
              return Container(
                width: double.infinity,
                //margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.fill,
                ),
              );
            }).toList(),
            options: CarouselOptions(
                initialPage: 0,
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                reverse: true,
                onPageChanged: (index, _) {
                  setState(() {
                    current = index;
                  });
                },
                enableInfiniteScroll: true)),
        const SizedBox(
          height: 30,
        ),
        containerBuild(0),
        containerBuild(1),
        containerBuild(2),
        const SizedBox(height: 30),
        const Text(
          'Slider 2 : initial page index',
          style: TextStyle(color: Colors.amber),
          textAlign: TextAlign.center,
        ),
        CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: Image.asset(
                  imgList[itemIndex],
                  fit: BoxFit.fill,
                ),
              );
            },
            options: CarouselOptions(
                initialPage: 0,
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                scrollDirection: Axis.vertical,
                autoPlayInterval: Duration(seconds: 2))),
      ],
    );
  }

  Container containerBuild(index) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: current == index ? Colors.blue : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Center selectebalTExt() {
    return Center(
      child: Container(
        width: 200,
        height: 40,
        color: Colors.green,
        child: Column(children: [
          // Text(
          //   'spsh qjdfh jklmskfdql lmksqdf klsdqkflsfjkhgjuihnjdfghiej',
          //   style: TextStyle(fontSize: 25, color: Colors.amber),
          //   overflow: TextOverflow.fade,
          //   softWrap: true,
          // ),
          SelectableText(
            'hezkmsf kslmdfksl sf ksdlfmk sdlfk slkfsklskf lskflmskf mksdmlf ks',
            showCursor: true,
            toolbarOptions: ToolbarOptions(copy: true),
          )
        ]),
      ),
    );
  }

  ElevatedButton alert(BuildContext context) {
    return ElevatedButton(
      child: Text('Click me'),
      onPressed: () {
        final alert = AlertDialog(
          title: Text('Dialog title'),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                const Divider(
                  color: Colors.black,
                ),
                const Text('Dialog contenet qsfqsdf sdkfsd f'),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Close me'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        );
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return alert;
            });
      },
    );
  }

  // TextButton buildTextButtontoast() {
  //   return TextButton(
  //     onPressed: () {
  //       Fluttertoast.showToast(
  //           msg: "This is Center Short Toast2",
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.TOP,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.red,
  //           fontSize: 16.0);
  //     },
  //     child: buildRichText(),
  //   );
  // }

  RichText buildRichText() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Pink',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.pink),
          ),
          TextSpan(
            text: 'Black',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
