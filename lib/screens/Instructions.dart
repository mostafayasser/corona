import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../src/config.dart';
import 'package:flutter/cupertino.dart';
import '../models/app_localizations.dart';
import './HomePage.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('Instructions'),
              style: TextStyle(color: Color(0xFF51b5D8))),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: false,
          itemCount: images.length,
          pagination: new SwiperPagination(margin: EdgeInsets.only(bottom: 100),
          builder: new DotSwiperPaginationBuilder(
            color: Color(0xFF9FDDEF),
            activeColor: Color(0xFF51b5D8),
            space: 10.0,
          )
          ),
          control: new SwiperControl(color: Color(0xFF51b5D8)),
        ),
        backgroundColor: Colors.blueGrey.shade200,
        floatingActionButton: 
           FloatingActionButton.extended(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(HomePage.route),
            tooltip: 'Skip',
            backgroundColor: Colors.white,
            label: Text(
              'Skipتخطي>>',
              style: TextStyle(color: Color(0xFF51b5D8)),
            ),
          ),
        );
  }
}
