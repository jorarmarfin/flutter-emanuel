import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colores
const mPrimaryColor = Colors.purple;
// const mNaranja = Colors.orange;
// const mRojo = Colors.red;
// const mAmarillo = Colors.yellow;
// const mCeleste = Colors.blueAccent;
const mNaranja = Color(0xffFF9A3B);
const mRojo = Color(0xffFF9A3B);
const mAmarillo = Color(0xffFF9A3B);
const mCeleste = Color(0xffFF9A3B);
const mColorBlanco = Colors.white;
const mTextColor = Colors.black;
//Imagenes
const imgLoading = 'assets/images/loading.gif';
const imgFondo = 'assets/images/fondo.gif';

class DefaultTheme {
  static ThemeData base = ThemeData.light().copyWith(
      primaryColor: mPrimaryColor,
      //Esquema de colores para el appBar
      appBarTheme: const AppBarTheme(
        backgroundColor: mRojo,
        foregroundColor: Colors.white, //here you can give the text color
        // elevation: 0 // si hay o no sombra
      ),
      textTheme: TextTheme(
          headline1: GoogleFonts.getFont('Dancing Script',
              fontSize: 20, fontWeight: FontWeight.normal),
          headline2:
              GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20),
          headline3: GoogleFonts.nunito(fontSize: 20, color: mColorBlanco),
          bodyText1:
              const TextStyle(color: Colors.black), //para enfatizar texto
          bodyText2: const TextStyle(
              color: mTextColor, fontSize: 20) //para texto del body
          ));
}
