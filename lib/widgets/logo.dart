import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  
  final String titulo;

  const Logo({
    super.key,
    required this.titulo
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  
  bool logoClicked = false;
  
  void _logoClick() {
    logoClicked = !logoClicked; 
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only( top: 50),
        child: Column(
          children: [
            GestureDetector(
              onTap: () =>_logoClick(),
              child: Image.asset(
                logoClicked ? 'assets/medusa_icon.png'  : 'assets/apolo_icon.png',
                fit: BoxFit.cover, // Fixes border issues
                width: 110.0,
                height: 110.0,
              ),
            ),
            const SizedBox( height: 10 ),
            Text( widget.titulo, style: const TextStyle( fontSize: 24 ),)
          ],
        ),
      ),
    );
  }
}

