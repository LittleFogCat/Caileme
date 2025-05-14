import 'package:caileme/pages/prediction_list.dart';
import 'package:caileme/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(const MyApp());
}

const Color lightGray = Color(0xFFF3F3F3);
const Color darkBlue = Color(0xFF1847FF);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme(
        //   brightness: Brightness.light,
        //   primary: Colors.black,
        //   onPrimary: Colors.black,
        //   secondary: Colors.yellowAccent,
        //   onSecondary: Colors.white,
        //   error: Colors.red,
        //   onError: Colors.yellow,
        //   surface: Colors.transparent,
        //   onSurface: Colors.black,
        // ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(foregroundColor: WidgetStateProperty.all(Colors.black)),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((state) {
              return Colors.white; // 选中时背景色为白色
            }),
            foregroundColor: WidgetStateProperty.resolveWith((state) {
              return Colors.black; // 选中时背景色为白色
            }),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 120, title: _AppTitle()),
      body: PredictionList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        tooltip: 'HELP',
        shape: CircleBorder(),
        child: const Icon(Icons.help_outline, size: 44),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            spacing: 8,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flutter_dash, color: Colors.black, size: 36),
                      SizedBox(width: 10),
                      Text(
                        "Caile.me",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 40,
                width: 600,
                child: SearchBar(
                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                  leading: Icon(Icons.search_rounded, color: Colors.grey, size: 22),
                  hintText: "Search on Caile.me",
                  hintStyle: WidgetStateProperty.all(TextStyle(color: Colors.grey, fontSize: 16)),
                  trailing: [Icon(Icons.clear, color: Colors.grey, size: 18)],
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(color: lightGray, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith((state) {
                    if (state.contains(WidgetState.selected)) {
                      return Colors.white; // 选中时背景色为白色
                    }
                    return lightGray; // 平时背景色
                  }),
                  overlayColor: WidgetStateProperty.all(Colors.white),
                  shadowColor: WidgetStateProperty.all(Colors.transparent),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text("Log In", style: TextStyle(color: darkBlue, fontSize: 15, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                width: 88,
                height: 36,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    backgroundColor: WidgetStateProperty.all(darkBlue),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ],
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            MyTextButton(
              onPressed: () {
                Toast.show("???");
              },
              text: "Tending",
              fontSize: 16,
            ),
            TextButton(onPressed: () {}, child: Text("New")),
            TextButton(onPressed: () {}, child: Text("Politics")),
            TextButton(onPressed: () {}, child: Text("Sports")),
            TextButton(onPressed: () {}, child: Text("Crypto")),
            TextButton(onPressed: () {}, child: Text("Tech")),
          ],
        ),
        Divider(color: Color(0xffeeeeee), thickness: 0),
      ],
    );
  }
}
