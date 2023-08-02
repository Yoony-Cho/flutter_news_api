import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_service.dart';

import 'main_listview.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DataService()), // DataService 인스턴스 생성
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // 데이터 서비스 인스턴스 가져오기
    final dataService = Provider.of<DataService>(context);

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          const TextTheme(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('News'),
        ),
        body: MainListView(dataService: dataService),
      ),
    );
  }
}
