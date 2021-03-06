import 'package:flutter/material.dart';
import 'package:flutter_twenty_twenty/draggable_handle.dart';

class TwentyTwenty extends StatefulWidget {
  final GlobalKey? key;
  final Widget? leftChild;
  final Widget? rightChild;
  final double? width;
  final double? defaulPostion;
  final Color? handleColor;

  const TwentyTwenty({
    @required this.key,
    @required this.leftChild,
    @required this.rightChild,
    this.width,
    this.defaulPostion = 0.0,
    this.handleColor = Colors.black,
  }) : assert(
          defaulPostion != null &&
              (defaulPostion >= 0.0 && defaulPostion <= 1.0),
        );

  @override
  _TwentyTwentyState createState() => _TwentyTwentyState();
}

class _TwentyTwentyState extends State<TwentyTwenty> {
  GlobalKey handlKey = GlobalKey();
  GlobalKey? twentyTwentyKey;
  double? currentWidth;
  double horizontalPosition = .0;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
    twentyTwentyKey = widget.key;
    horizontalPosition = widget.defaulPostion as double;
    super.initState();
  }

  void _getRenderOffsets() {
    setState(() {
      currentWidth = twentyTwentyKey!.currentContext!.size!.width;
    });
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: widget.leftChild as Widget),
        Positioned.fill(
          left: (currentWidth ?? 0.0) * horizontalPosition,
          child: widget.rightChild as Widget,
        ),
        DraggableHandler(
          defaulPostion: horizontalPosition,
          handleColor: widget.handleColor,
          valueChanged: (value) {
            print(value);
            setState(() {
              horizontalPosition = value;
            });
          },
        )
      ],
    );
  }
}
