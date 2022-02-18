import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colores
const colorPrimaryColor = Colors.purple;
const colorNaranja = Color(0xffFF9A3B);
const colorRojo = Color(0xffEB445C);
const colorAmarillo = Color(0xffFFD101);
const colorCeleste = Color(0xff71EFE6);
const colorColorBlanco = Colors.white;
const colorTextColor = Colors.black;
//Imagenes
const imgLoading = 'assets/images/loading.gif';
const imgFondo = 'assets/images/fondo.png';
const imgSanto = 'assets/images/santosinimagen.png';

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
          subtitle1: GoogleFonts.josefinSans(fontSize: 17, color: Colors.black),
          bodyText1:
              const TextStyle(color: Colors.black), //para enfatizar texto
          bodyText2: const TextStyle(
              color: colorTextColor, fontSize: 20) //para texto del body
          ));
}

BoxDecoration estiloRecuadro(color) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(20),
  );
}
