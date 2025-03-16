library flutter_swiftui;


import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'dart:async';

extension AdjustingThePaddingOfAView on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget padded(double amount) =>
      Padding(padding: EdgeInsets.all(amount), child: this);

  Widget paddedLeft(double amount) =>
      Padding(padding: EdgeInsets.only(left: amount), child: this);

  Widget paddedRight(double amount) =>
      Padding(padding: EdgeInsets.only(right: amount), child: this);

  Widget paddedTop(double amount) =>
      Padding(padding: EdgeInsets.only(top: amount), child: this);

  Widget paddedBottom(double amount) =>
      Padding(padding: EdgeInsets.only(bottom: amount), child: this);

  Widget paddedLeftRight(double amount) =>
      Padding(padding: EdgeInsets.only(left: amount, right: amount), child: this);

  Widget paddedTopBottom(double amount) =>
      Padding(padding: EdgeInsets.only(top: amount, bottom: amount), child: this);

  /// Pads the view using the specified edge insets.
  Widget paddedInsets(EdgeInsets insets) =>
      Padding(padding: insets, child: this);

  Widget paddedOnly(
      { double left = 0.0,
        double top = 0.0,
        double right = 0.0,
        double bottom = 0.0,}) =>
      Padding(padding: EdgeInsets.only(left: left, top:top, right: right, bottom:bottom), child: this);

/// func padding(Edge.Set, CGFloat?) -> View
/// Pads the view using the specified edge insets.
}

extension SettingTheForegroundOrBackgroundOfAView on Widget {
  /// func overlay<Overlay>(Overlay, alignment: Alignment) -> View
  /// Layers a secondary view in front of the view.
  Widget overlay(
      Widget overlay, {
        Key? key,
        Alignment alignment = Alignment.center,
        StackFit fit = StackFit.loose,
      }) =>

      Stack(key:key,
          alignment: alignment,
          fit:fit,
          children: <Widget>[this, overlay]);

  /// func foregroundColor(Color?) -> View
  /// Sets the color that the view uses for foreground elements.

  /// func background<Background>(Background, alignment: Alignment) -> View
  Widget background(
      Widget background, [
        Alignment alignment = Alignment.center,
      ]) =>
      Stack(alignment: alignment, children: <Widget>[Positioned.fill(child: background), this]);

  Widget backgroudColor(Color color) {
    return Container(color: color, child: this);
  }

/// func zIndex(Double) -> View
/// Controls the display order of overlapping views.
}


extension SwiftBorder on Widget{

  Widget borderStyle(Border style) =>
      Container(decoration: BoxDecoration(border: style), child: this);

  Widget border({
    Key? key,
    double borderWidth = 1,
    double? borderRadius,
    Color borderColor = Colors.grey,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Clip clipBehavior = Clip.none,
  }) {

    BorderRadius? borderRadius2;
    if (borderRadius != null){
      borderRadius2 = BorderRadius.all(
          Radius.circular(borderRadius) //                 <--- border radius here
      );
    }

    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      // color: color,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
            color: borderColor,
            width: borderWidth
        ),
        borderRadius: borderRadius2,
      ),
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: this,
      clipBehavior: clipBehavior,
    );
  }

}

class GestureDetectorBuilder {

  Widget child;
  GestureTapCallback? _onTap;
  GestureTapUpCallback? _onTapUp;
  GestureTapDownCallback? _onTapDown;
  GestureLongPressCallback? _onLongPress;
  GestureTapCallback? _onDoubleTap;

  GestureDetectorBuilder(this.child);

  GestureDetector build(){
    return GestureDetector(
        child:child,
        onTap: _onTap,
        onTapUp: _onTapUp,
        onTapDown: _onTapDown,
        onDoubleTap: _onDoubleTap,
        onLongPress:_onLongPress);
  }

  GestureDetectorBuilder onTap(GestureTapCallback onTap) {
    this._onTap = onTap;
    return this;
  }

  GestureDetectorBuilder onTapUp( GestureTapUpCallback? onTapUp) {
    this._onTapUp = onTapUp;
    return this;
  }

  GestureDetectorBuilder onTapDown(GestureTapDownCallback? onTapDown) {
    this._onTapDown = onTapDown;
    return this;
  }

  GestureDetectorBuilder onLongPress(GestureLongPressCallback onLongPress) {
    this._onLongPress = onLongPress;
    return this;
  }

  GestureDetectorBuilder onDoubleTap(GestureTapCallback onDoubleTap) {
    this._onDoubleTap = onDoubleTap;
    return this;
  }
}

extension SwiftTap on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget onTap(GestureTapCallback onTap, {
    Key? key,
    HitTestBehavior? behavior}) =>
      GestureDetector(
          onTap: onTap,
          child:this,
          key:key,
          behavior:behavior);

  Widget onTapUp(GestureTapUpCallback onTapUp, {
    Key? key,
    HitTestBehavior? behavior}) =>
      GestureDetector(
          onTapUp: onTapUp,
          child:this,
          key:key,
          behavior:behavior);

  GestureDetectorBuilder gestureBuilder() =>
      GestureDetectorBuilder(this);

}

extension GestureDetectorExtension on Widget {
  Widget gestureDetector({
    Key? key,
    GestureTapCallback? onTap,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCancelCallback? onTapCancel,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureTapCallback? onDoubleTap,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressEndCallback? onForcePressEnd,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureDragCancelCallback? onTertiaryTapCancel,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    String? debugLabel,
  }) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onDoubleTap: onDoubleTap,
      onForcePressStart: onForcePressStart,
      onForcePressEnd: onForcePressEnd,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onTertiaryTapCancel: onTertiaryTapCancel,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
      child: this,
    );
  }
}

extension SwiftContainer on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Clip clipBehavior = Clip.none,
  }) =>
      Container(
        key:key,
        alignment:alignment,
        padding:padding,
        color:color,
        decoration:decoration,
        foregroundDecoration:foregroundDecoration,
        width:width,
        height:height,
        constraints:constraints,
        margin:margin,
        transform:transform,
        child:this,
        clipBehavior:clipBehavior,
      );
}

extension SwiftExpanded on Widget {
  Widget expanded({
    Key? key,
    int flex = 1,
  })
  => Expanded(key:key, flex:flex, child: this,);

}

extension SwiftFlexible on Widget {
  Flexible flexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }){
    return Flexible(child: this, key:key, flex:flex, fit:fit);
  }
}

extension SwiftAspectRatio on Widget {
  Widget aspectRatio(double aspectRatio, {
    Key? key,
  })
  => AspectRatio(key:key, aspectRatio:aspectRatio, child: this,);

}

extension SwiftClipRRect on Widget {
  Widget clipRRect({
    Key? key,
    BorderRadius borderRadius = BorderRadius.zero,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  })
  => ClipRRect(key:key, borderRadius:borderRadius, clipper:clipper, clipBehavior:clipBehavior, child: this,);

  Widget roundCorner({
    Key? key,
    double radius = 8,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  })
  => ClipRRect(key:key, borderRadius:BorderRadius.circular(radius), clipper:clipper, clipBehavior:clipBehavior, child: this,);

}

extension SwiftIfWidget on Widget {
  Widget onlyIf(bool condition, Widget Function (Widget widget) callback){
    if (condition){
      return callback(this);
    }
    return this;
  }
}

extension v on Widget {
  Widget visible(bool visible,{
    Key? key,
  })
  => Visibility(key:key, visible: visible, child: this,);

  Widget center({
    Key? key,
  })
  => Center(key:key, child: this,);

  Widget safeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  })
  => SafeArea(key:key,
    left:left,
    top:top,
    right:right,
    bottom:bottom,
    minimum:minimum,
    maintainBottomViewPadding:maintainBottomViewPadding,
    child: this,);

  Widget scrollbar({
    Key? key,
    ScrollController? controller,
    bool? thumbVisibility,
    double? thickness,
    Radius? radius,
  })
  => Scrollbar(key:key,
    controller:controller,
    thumbVisibility:thumbVisibility,
    thickness:thickness,
    radius:radius,
    child: this,);

}

extension SCSV on Widget{
  Widget singleChildScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  })
  => SingleChildScrollView(
      key:key,
      child: this,
      scrollDirection:scrollDirection,
      reverse:reverse,
      padding:padding,
      primary:primary,
      physics:physics,
      controller:controller,
      dragStartBehavior:dragStartBehavior,
      clipBehavior:clipBehavior,
      restorationId:restorationId,
      keyboardDismissBehavior:keyboardDismissBehavior);
}

extension FractionallySizedBoxWidget on Widget {
  Widget fractionally({
    Key? key,
    Alignment alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
    double? sizeFactor,
  })
  => FractionallySizedBox(key:key,
      child: this,
      alignment: alignment,
      widthFactor:widthFactor ?? sizeFactor,
      heightFactor:heightFactor ?? sizeFactor);
}

extension NotificationListenerWidget on Widget {
  Widget notification<T extends Notification>({
    Key? key,
    NotificationListenerCallback<T>? onNotification,
  })
  => NotificationListener<T>(
      key:key,
      onNotification: onNotification,
      child: this
  );
}

extension SwiftConstrainedBox on Widget {
  Widget constrainedBox<T extends Notification>({
    Key? key,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  })
  => ConstrainedBox(
    constraints: BoxConstraints(
      minWidth:minWidth,
      maxWidth:maxWidth,
      minHeight:minHeight,
      maxHeight: maxHeight,
    ),
    child: this,
  );
}

extension SwiftRefreshIndicator on Widget {
  Widget refreshIndicator({required RefreshCallback onRefresh}){
    return RefreshIndicator(
      child: this,
      onRefresh: onRefresh,);
  }
}

extension ElevatedButtonEx on Widget {
  ElevatedButton elevatedButton({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none
  }){
    return ElevatedButton(
      child: this,
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus:autofocus,
      clipBehavior:clipBehavior
    );
  }
}


Text ColorText(String data, Color color){
  return Text(data, style: TextStyle(color: color),);
}


extension PositionedSwift on Widget {
  Positioned positioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }){
    return Positioned(
      child: this,
      left: left,
      top:top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,);
  }

  Positioned positionedFill({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }){
    return Positioned.fill(
      child: this,
      left: left,
      top:top,
      right: right,
      bottom: bottom,);
  }
}

extension BuildContextPush on BuildContext{
  void pushPage(Widget page){
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  void pop(){
    Navigator.of(this).pop();
  }
  
  void replaceCurrentPage(Widget page){
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (context) => page));
  }
}

extension SwiftOpacity on Widget{
  Opacity opacity(
      {Key? key,
        required double opacity,
        bool alwaysIncludeSemantics = false,})
  {
    return Opacity(child: this, key:key, opacity:opacity, alwaysIncludeSemantics:alwaysIncludeSemantics);
  }
}

extension SwiftAlign on Widget {
  Align align({Key? key,
    Alignment alignment = Alignment.center,
    double? widthFactor,
    double?  heightFactor,}){
    return Align(child: this, key: key, alignment: alignment, widthFactor: widthFactor, heightFactor: heightFactor,);
  }
}


extension SwiftAnimatedOpacity on Widget{

  AnimatedOpacity animatedOpacity({
    Key? key,
    required double opacity,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
    bool alwaysIncludeSemantics = false,
  }){
    return AnimatedOpacity(
      key: key,
      opacity: opacity,
      curve : Curves.linear,
      duration: duration,
      onEnd: onEnd,
      alwaysIncludeSemantics: false,
      child: this,
    );
  }
}

extension SwiftColorFilter on Widget {
  ColorFiltered colorFilterMode(Color color, BlendMode blendMode){
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color,
        blendMode,
      ),
      child: this,
    );
  }
}


extension SwiftClipPath on Widget {

  ClipPath clipPath({
    Key? key,
    CustomClipper<Path>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }){

    return ClipPath(
      key: key,
      clipper: clipper,
      clipBehavior:clipBehavior,
      child : this,
    );

  }
}


extension SwiftCustomPaint on Widget {

  CustomPaint customPaint({
    Key? key,
    CustomPainter? painter,
    CustomPainter? foregroundPainter,
    Size size = Size.zero,
    bool isComplex = false,
    bool willChange = false,
  }){

    return CustomPaint(
      key: key,
      painter: painter,
      foregroundPainter: foregroundPainter,
      size: size,
      isComplex:isComplex,
      willChange:willChange,
      child: this,);
    
  }
}

class FutureBuilder2<T> {

  final Future<T> future;
  Function(BuildContext context, Object error)? _onError;
  Function(BuildContext context)? _onProgress;
  Function(BuildContext context, T data)? _onData;

  Key? key;

  FutureBuilder2(this.future, {this.key});

  FutureBuilder2 onData(Function(BuildContext context, T data)? onData){
    _onData = onData;
    return this;
  }

  FutureBuilder2 onProgress(Function(BuildContext context)? onProgress){
    _onProgress = onProgress;
    return this;
  }

  FutureBuilder2 onError(Function(BuildContext context, Object error)? onError){
    _onError = onError;
    return this;
  }

  FutureBuilder<T> build()
  {

    return FutureBuilder<T>(
      key: key,
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError){
          return _onError?.call(context, snapshot.error!) ?? Container();
        }

        if (snapshot.connectionState != ConnectionState.done){
          return _onProgress?.call(context) ?? CircularProgressIndicator().center();
        }

        return _onData?.call(context, snapshot.data!) ?? Container();
      },
    );
  }

}

//Future<ValueNotifier<T>> valueNotifier
class FutureValueNotifierListener<T> extends FutureBuilder2<ValueNotifier<T>>{
  Future<ValueNotifier<T>> futurevalueNotifier;


  Widget Function(BuildContext context, T data)? _onData2;

  FutureValueNotifierListener(this.futurevalueNotifier) : super(futurevalueNotifier)
  {
    super.onData(_onMyData);
  }

  Widget _onMyData(BuildContext context, ValueNotifier<T> valueNotifier){

    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, T data, Widget? child) {
        return _onData2?.call(context, data) ?? Container();
      },);
  }

  FutureBuilder2 onData2(Widget Function(BuildContext context, T data)? onData){
    _onData2 = onData;
    return this;
  }

}


extension SwiftRawKeyboardListener on Widget{
  RawKeyboardListener rawKeyboardListener({
    Key? key,
    required FocusNode focusNode,
    ValueChanged<RawKeyEvent>? onKey,
    bool autofocus = false,
    bool includeSemantics = true}){
    return RawKeyboardListener(child: this, key: key, focusNode: focusNode, onKey:onKey);
  }
}


extension SwiftBoxShadow on Widget {

  Container boxShadow(){
    return Container(
      child: this,
      decoration: BoxDecoration(
        // color: Colors.transparent,
        // borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(10),
        //     topRight: Radius.circular(10),
        //     bottomLeft: Radius.circular(10),
        //     bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey, //shadow color
            spreadRadius: 3, // spread radius
            blurRadius: 5, // shadow blur radius
            offset: const Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

extension SwiftIgnorePointer on Widget {
  IgnorePointer ignorePointer({
    Key? key,
    bool ignoring = true,
    bool? ignoringSemantics,
}){
    return IgnorePointer(
      key: key,
      child: this,
      ignoring: ignoring,
      ignoringSemantics:ignoringSemantics
    );
  }
}

extension SwiftTransform on Widget {

  Transform rotate({
    Key? key,
    required double angle,
    Offset? origin,
    Alignment alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality}){
    return Transform.rotate(
        key:key,
        angle: angle,
        origin:origin,
        alignment:alignment,
        transformHitTests:transformHitTests,
        filterQuality:filterQuality,
        child: this,
    );
  }

  Transform scale({
    Key? key,
    double? scale,
    double? scaleX,
    double? scaleY,
    Offset? origin,
    Alignment alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality}){
    return Transform.scale(
      key:key,
      scale: scale,
      scaleX: scaleX,
      scaleY: scaleY,
      origin:origin,
      alignment:alignment,
      transformHitTests:transformHitTests,
      filterQuality:filterQuality,
      child: this,
    );
  }


  Transform flip({
    Key? key,
    bool flipX = false,
    bool flipY = false,
    Offset? origin,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }){
    return Transform.flip(
      key: key,
      flipX: flipX,
      flipY: flipY,
      origin: origin,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: this,
    );
  }
}


// 溢出盒子扩展
extension UnNestOverflowBox on Widget {
  Widget overflowBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) =>
      OverflowBox(
        key: key,
        alignment: alignment,
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: this,
      );
}


enum OuterSeparatorMode{
  top,
  bottom,
  both,
  none
}

extension SeparatorBuilderList on List<Widget> {

  List<Widget> separatorBuilder(
      OuterSeparatorMode mode,
      Widget Function(int index) builder
      ){


    int insetIndex;
    if (mode == OuterSeparatorMode.top || mode == OuterSeparatorMode.both){

      this.insert(0, builder(-1));
      insetIndex = 2;
    }
    else {
      insetIndex = 1;
    }

    var sepratorIndex = 0;

    for (var i=insetIndex;i<this.length;i+=2){
      this.insert(i, builder(sepratorIndex));
      sepratorIndex ++;
    }

    if (mode == OuterSeparatorMode.bottom || mode == OuterSeparatorMode.both){
      this.add(builder(sepratorIndex));
    }

    return this;
  }
}
