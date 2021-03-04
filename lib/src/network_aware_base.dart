import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:network_aware/network_aware.dart';
import 'package:overlay_support/overlay_support.dart';

class NetworkAware extends StatefulWidget {
  ///Typically a [MaterialApp] widget or any widget you want desendants to be network aware
  final Widget child;

  /// If Network Indicator Widget should be dismissible, defaults to [true]
  final bool canDismiss;

  /// Network Prompt [Widget] to display when users loose internet connection
  final Widget indicatorWidget;

  /// Anchor Position for [indicatorWidget]
  final NetworkAwarePosition position;
  NetworkAware(
      {@required this.indicatorWidget,
      this.child,
      this.canDismiss = true,
      this.position = NetworkAwarePosition.TOP});
  @override
  _NetworkAwareState createState() => _NetworkAwareState();
}

class _NetworkAwareState extends State<NetworkAware> {
  NetworkConnectivityService _networkConnectivityService =
      NetworkConnectivityService();
  @override
  void initState() {
    OverlaySupportEntry _entry;
    _networkConnectivityService.stream.listen((event) {
      if (event) {
        _entry = showOverlayNotification((context) {
          return ActivityWidget(
            child: widget.indicatorWidget,
            alignment: widget.position,
            canDismiss: widget.canDismiss,
          );
        }, duration: Duration.zero);
      } else {
        _entry?.dismiss();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _networkConnectivityService?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(child: widget.child);
  }
}
