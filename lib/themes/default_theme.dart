import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colores
const colorPrimaryColor = Colors.purple;
const colorNaranja = Color(0xffFF9A3B);
const colorRojo = Color(0xffEB445C);
const colorAmarillo = Color(0xffFFD101);
const colorCeleste = Color(0xff71EFE6);
const colorBlanco = Colors.white;
const colorTextColor = Colors.black;

//Imagenes
const imgLoading = 'assets/images/loading.gif';
const imgFondo = 'assets/images/fondo.png';
const imgSanto = 'assets/images/santosinimagen.png';

//Iconos
const icoNosotros = 'assets/icons/about.png';
const icoBiblioteca = 'assets/icons/book-stack.png';
const icoCumples = 'assets/icons/cake.png';
const icoMisas = 'assets/icons/chapel.png';
const icoServicios = 'assets/icons/cleaning.png';
const icoConstruccion = 'assets/icons/construccion2.gif';
const icoOfrendas = 'assets/icons/money-bag.png';
const icoFormacion = 'assets/icons/read.png';
const icoEnlaces = 'assets/icons/zoom.png';
const icoHistoria = 'assets/icons/history.png';
const icoEspiritualidad = 'assets/icons/praying.png';
const icoSantisimo = 'assets/icons/eucharist.png';
const icoAvisos = 'assets/icons/news.png';

class DefaultTheme {
  static ThemeData base = ThemeData.light().copyWith(
      primaryColor: colorPrimaryColor,
      //Esquema de colores para el appBar
      appBarTheme: const AppBarTheme(
        backgroundColor: colorRojo,
        foregroundColor: Colors.white, //here you can give the text color
        // elevation: 0 // si hay o no sombra
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.akayaTelivigala(
            fontSize: 60, color: colorTextColor, fontWeight: FontWeight.bold),
        headline2: GoogleFonts.josefinSans(fontSize: 20, color: Colors.white),
        headline3: GoogleFonts.josefinSans(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        headline4: GoogleFonts.josefinSans(fontSize: 20, color: Colors.black),
        headline5: GoogleFonts.josefinSans(fontSize: 15, color: Colors.white),
        headline6: GoogleFonts.josefinSans(fontSize: 20, color: Colors.white),
        subtitle1: GoogleFonts.josefinSans(fontSize: 17, color: Colors.black),
        subtitle2: GoogleFonts.josefinSans(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        bodyText1:
            const TextStyle(color: Colors.black, fontSize: 17, wordSpacing: 5),
        bodyText2:
            const TextStyle(color: Colors.black, fontSize: 10, wordSpacing: 5),
        caption:
            const TextStyle(color: Colors.black, fontSize: 7, wordSpacing: 5),
      ));
}

BoxDecoration estiloRecuadro(color) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(20),
  );
}

BoxDecoration estiloBoton(color) {
  return BoxDecoration(
    color: color,
    border: Border.all(color: Colors.white, width: 2.5),
    borderRadius: BorderRadius.circular(20),
  );
}
