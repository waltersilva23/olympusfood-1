import 'package:flutter/material.dart';
import 'package:olympusfood/screens/navigation.dart';

class CarteiraScreen extends StatefulWidget {
  const CarteiraScreen({super.key});

  @override
  State<CarteiraScreen> createState() => _CarteiraScreenState();
}

class _CarteiraScreenState extends State<CarteiraScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navigation(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 73, 180, 23),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 166, 42, 42)
                      ),
                      child: const Center(
                        child: Text('ESCOLA RAIO DE SOL')
                      ) 
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Image.network(
                        'https://picsum.photos/200',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              )
              
            ),
          ],
        )
      ),
    );
  }
}