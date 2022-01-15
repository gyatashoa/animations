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

class _HotelCardState extends State<HotelCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0) {
          setState(() {
            expanded = true;
          });
        } else if (details.delta.dy > 0) {
          setState(() {
            expanded = false;
          });
        }
      },
      onTap: () {},
      child: Stack(
        children: [
          AnimatedPositioned(
            bottom: expanded ? 150 : 100,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: devSize.height * .6,
              decoration: BoxDecoration(
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
