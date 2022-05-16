import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CardWidget extends StatefulWidget {

  CardWidget(
      {Key? key,
        this.width,
        this.height,
        required this.borderRadius,
        required this.child,
        this.padding,
        this.margin,})
      : super(key: key);
  double? width;
  double? height;
  Widget child;
  double borderRadius;
  EdgeInsets? padding;
  EdgeInsets? margin;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? const EdgeInsets.all(12),
      margin: widget.margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: Colors.grey.shade300,
        boxShadow:[
          BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0
          ),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
