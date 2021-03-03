# network_aware

A Flutter package that enables your flutter apps to be network aware.
It overlays a widget over your app when internet connection is off.
## Compatibility
Android and IOS

## Usage


#### Add import statement
``` dart
    import 'package:network_aware/network_aware.dart';
    
```

#### Wrap your root MaterialApp in a [NetworkAware] Widget
``` dart
    NetworkAware(
      canDismiss: true,
      position: NetworkAwarePosition.TOP, 
      indicatorWidget: IndicatorWidget(), 
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'NetworkAware Test'),
      ),
    );


//For full example, visit the example app repo


```