import 'package:daily_taskk/HomePage.dart';
import 'package:daily_taskk/screens/TextFildDynamic/Textfild.dart';
import 'package:daily_taskk/screens/TextFildDynamic/viwe.dart';
import 'package:daily_taskk/screens/pdf/InvoiceScreen1.dart';
import 'package:daily_taskk/screens/pdf/Pdf1.dart';
import 'package:flutter/cupertino.dart';


class AppRouts{
       static Map<String, Widget Function(BuildContext)> routes =
       {
              '/': (context) => TextField(),
              '/view':(context)=>ViewScreen(),
             // '/':(context)=> const InvoiceScreen(),
             // '/pdf':(context)=> const PdfScreen(),
            //  '/home':(context)=> const Homepage(),


       };
}