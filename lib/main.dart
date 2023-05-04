import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/req_page.dart';
import 'pages/wallet_connect.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      routes: {
        '/': (context) => const HomePage(),
        '/walletcon': (context) => const WalletConnect(),
        '/request': (context) => const RequestPage(),
      },
      initialRoute: '/',
    );
  }
}