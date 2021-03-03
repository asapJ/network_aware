import 'package:flutter/material.dart';
import 'package:network_aware/network_aware.dart';
import 'package:overlay_support/overlay_support.dart';

class ActivityWidget extends StatefulWidget {
  final Widget child;
  final NetworkAwarePosition alignment;
  final bool canDismiss;

  ActivityWidget(
      {@required this.child, @required this.alignment, this.canDismiss});
  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (!widget.canDismiss) return;
        OverlaySupportEntry.of(context).dismiss(animate: false);
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: alignment,
            children: [
              SlideDismissible(
                  key: ValueKey(null),
                  child: widget.child,
                  enable: widget.canDismiss)
            ],
          ),
        ),
      ),
    );
  }

  MainAxisAlignment get alignment =>
      widget.alignment == NetworkAwarePosition.TOP
          ? MainAxisAlignment.start
          : widget.alignment == NetworkAwarePosition.CENTER
              ? MainAxisAlignment.center
              : MainAxisAlignment.end;
}
