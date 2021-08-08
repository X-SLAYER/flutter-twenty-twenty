import 'package:flutter/material.dart';

class DraggableHandler extends StatefulWidget {
  final ValueChanged<double>? valueChanged;
  final ValueChanged<Offset>? offsetChanged;
  final double defaulPostion;
  final Color? handleColor;

  DraggableHandler({
    this.valueChanged,
    this.defaulPostion = .0,
    this.offsetChanged,
    this.handleColor = Colors.black,
  });

  @override
  DraggableHandlerState createState() {
    return new DraggableHandlerState();
  }
}

class DraggableHandlerState extends State<DraggableHandler> {
  ValueNotifier<double> valueListener = ValueNotifier(.0);
  ValueNotifier<Offset> offsetListner = ValueNotifier(Offset(0, 0));

  @override
  void initState() {
    valueListener = ValueNotifier(widget.defaulPostion);
    valueListener.addListener(notifyParent);
    offsetListner.addListener(notifyParent);
    super.initState();
  }

  void notifyParent() {
    if (widget.valueChanged != null) {
      widget.valueChanged!(valueListener.value);
    }
    if (widget.offsetChanged != null) {
      widget.offsetChanged!(offsetListner.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final handle = GestureDetector(
          onHorizontalDragUpdate: (details) {
            offsetListner.value = Offset(details.delta.dx, 0.0);
            valueListener.value =
                (valueListener.value + details.delta.dx / context.size!.width)
                    .clamp(.0, 1.0);
          },
          child: handlerStick(),
        );
        return AnimatedBuilder(
          animation: valueListener,
          builder: (context, child) {
            return Align(
              alignment: Alignment(valueListener.value * 2 - 1, 0),
              child: Container(child: child),
            );
          },
          child: handle,
        );
      },
    );
  }

  Widget handlerStick() {
    return FractionallySizedBox(
      widthFactor: 0.05,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                color: widget.handleColor,
                width: 3,
              ),
            ),
            Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.handleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
