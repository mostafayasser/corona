import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import '../widgets/text_field.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../src/ExampleCustom.dart';
import '../src/config.dart';
import '../src/ExampleSwiperInScrollView.dart';
import './main_screen.dart';
import 'package:flutter/cupertino.dart';
import '../models/auth.dart';
import '../models/app_localizations.dart';
import '../models/dialog.dart';
import './HomePage.dart';


class Instructions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('Instructions'), style: TextStyle(
              color: Color(0xFF51b5D8))),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),

        body: new Swiper (
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: images.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),


        ),

    backgroundColor: Colors.blueGrey.shade200,
    floatingActionButton: FloatingActionButton(
    onPressed: () =>  (Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()))),
    tooltip: 'Skip',
    child: const Icon(Icons.close),
    ),
    );
  }
}
