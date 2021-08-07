import 'package:flutter/material.dart';
import 'package:flutter_twenty_twenty/draggable_handle.dart';

class TwentyTwenty extends StatefulWidget {
  final GlobalKey? key;
  final Widget? firstChild;
  final Widget? secondeChild;
  final double? width;
  final double? defaulPostion;

  const TwentyTwenty({
    @required this.key,
    @required this.firstChild,
    @required this.secondeChild,
    this.width,
    this.defaulPostion = 0.0,
  });

  @override
  _TwentyTwentyState createState() => _TwentyTwentyState();
}

class _TwentyTwentyState extends State<TwentyTwenty> {
  GlobalKey handlKey = GlobalKey();
  GlobalKey? twentyTwentyKey;
  double? currentWidth;
  double horizontalPosition = 0.0;

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
        Positioned.fill(child: widget.firstChild as Widget),
        Positioned.fill(
          left: (currentWidth ?? 0.0) * horizontalPosition,
          child: widget.secondeChild as Widget,
        ),
        DraggableHandler(
          defaulPostion: 0.0,
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
