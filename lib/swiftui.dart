library flutter_swiftui;


import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


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


/// func padding(Edge.Set, CGFloat?) -> View
/// Pads the view using the specified edge insets.
}

extension SettingTheForegroundOrBackgroundOfAView on Widget {
  /// func overlay<Overlay>(Overlay, alignment: Alignment) -> View
  /// Layers a secondary view in front of the view.
  Widget overlay(
      Widget overlay, [
        Alignment alignment = Alignment.center,
      ]) =>
      Stack(alignment: alignment, children: <Widget>[this, overlay]);

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
    double width = 1,
    double? radius,
    Color color = Colors.grey
  }){
    BorderRadius? borderRadius;
    if (radius != null){
      borderRadius = BorderRadius.all(
          Radius.circular(radius) //                 <--- border radius here
      );
    }

    return Container(
      child: this,
      decoration: BoxDecoration(
        border: Border.all(
            color: color,
            width: width
        ),
        borderRadius: borderRadius,
      ),
    );
  }
}

class GestureDetectorBuilder {

  Widget child;
  GestureTapCallback? onTap2;
  GestureLongPressCallback? onLongPress2;

  GestureDetectorBuilder(this.child);

  GestureDetector build(){
    return GestureDetector(
        child:child,
        onTap: onTap2,
        onLongPress:onLongPress2);
  }

  GestureDetectorBuilder onTap(GestureTapCallback onTap) {
    this.onTap2 = onTap;
    return this;
  }

  GestureDetectorBuilder onLongPress(GestureLongPressCallback onLongPress) {
    this.onLongPress2 = onLongPress;
    return this;
  }
}

extension SwiftTap on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget onTap(GestureTapCallback onTap) =>
      GestureDetector( onTap: onTap, child:this);

  GestureDetectorBuilder gestureBuilder() =>
      GestureDetectorBuilder(this);
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
    bool isAlwaysShown = false,
    double? thickness,
    Radius? radius,
  })
  => Scrollbar(key:key,
    controller:controller,
    isAlwaysShown:isAlwaysShown,
    thickness:thickness,
    radius:radius,
    child: this,);

}

extension SCSV on Widget{
  Widget singleChildScrollView({
    Key? key
  })
  => SingleChildScrollView(key:key, child: this,);
}

extension FractionallySizedBoxWidget on Widget {
  Widget fractionally({
    Key? key,
    Alignment alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  })
  => FractionallySizedBox(key:key,
      child: this,
      alignment: alignment,
      widthFactor:widthFactor,
      heightFactor:heightFactor);
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
}
