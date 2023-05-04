import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NomadApp'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const FlutterLogo(
                size: 200,
              ),
              const SizedBox(height: 45,),
              const Text('Please connect to your wallet to continue', 
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500
                ),
                ),
                const SizedBox(height: 25,),
                Image.asset(
                  'assets/images/metamask-logo.png',
                  width: 100,
                  height: 100,
                  ),
              const SizedBox(height: 25,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/walletcon');
                },
                child: const Text('Wallet Connect'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}