import 'package:animation_app/constants.dart';
import 'package:animation_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';

class ZoomView extends StatefulWidget {
  const ZoomView({super.key});

  @override
  State<ZoomView> createState() => _ZoomViewState();
}

class _ZoomViewState extends State<ZoomView> {
  var _isZoomedIn = false;
  var _size = 70.0;
  var _curve = Curves.bounceIn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                width: _size,
                curve: _curve,
                child: Image.asset(AppConstants.flutterLogo)),
            TextButton(
              onPressed: () {
                setState(() {
                  _isZoomedIn = !_isZoomedIn;
                  _size = _isZoomedIn ? 150.0 : 70.0;
                  _curve = _isZoomedIn ? Curves.bounceOut : Curves.bounceIn;
                });
              },
              child: const Text('Zoom!'),
            )
          ],
        )
      ],
    );
  }
}

class ZoomBuilder extends ItemBuilder {
  const ZoomBuilder();
  @override
  Widget buildWidget() {
    return const ZoomView();
  }
}
