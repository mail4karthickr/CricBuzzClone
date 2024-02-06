import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height = 48,
    this.width,
    this.onTap,
    this.child
  });

  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black12)
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.width,
    required this.height
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.black26,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.5,
            color: Colors.black26
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8
          )
        ]
      ),
    );
  }
}

class CBDropDown extends StatefulWidget {
  const CBDropDown({
    super.key, 
    required this.width, 
    required this.buttonHeight,
    required this .menuHeight
  });

  final double width;
  final double buttonHeight;
  final double menuHeight;

  @override
  State<CBDropDown> createState() => CBDropDownState();
}

class CBDropDownState extends State<CBDropDown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();
  
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: MenuWidget(width: widget.width, height: widget.menuHeight),
            ),
          );
        },
        child: ButtonWidget(
          onTap: onTap,
          width: widget.width,
          height: widget.buttonHeight,
          child: const Text('Button Text'),
        ),
      ),
    );
  }

  void onTap() {
    // _buttonWidth = context.size?.width;
    _tooltipController.toggle();
  }
}