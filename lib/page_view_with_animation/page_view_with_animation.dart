import 'package:animations/page_view_with_animation/hotel_card.dart';
import 'package:animations/page_view_with_animation/tempdata.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  MyPageView({Key? key}) : super(key: key);

  final PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: Color(0xff3B3B3B)
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [Colors.black, Colors.black45])

          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: hotels.length,
              itemBuilder: _itemBuilder),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return HotelCard(
      index: index,
      hotel: hotels[index],
    );
  }
}
