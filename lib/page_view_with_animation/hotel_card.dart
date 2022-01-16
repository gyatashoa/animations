import 'package:animations/page_view_with_animation/hotel_model.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatefulWidget {
  HotelCard({Key? key, required this.index, required this.hotel})
      : super(key: key);

  final int index;
  final Hotel hotel;

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool expanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      _controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0) {
          setState(() {
            expanded = true;
            _controller.forward();
          });
        } else if (details.delta.dy > 0) {
          setState(() {
            expanded = false;
            _controller.reverse();
          });
        }
      },
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: Container(
                  width: devSize.width * .75,
                  height: devSize.height * .6,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: expanded ? 150 : 100,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: devSize.height * .6,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0, 2))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.hotel.imageUrl)),
                  color:
                      Colors.primaries[widget.index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(20)),
              width: devSize.width * .75,
            ),
          ),
        ],
      ),
    );
  }
}
