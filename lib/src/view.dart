import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


extension AdjustingThePaddingOfAView on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget padded(double amount) =>
      Padding(padding: EdgeInsets.all(amount), child: this);

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

extension SettingTheBorderOfAView on Widget {
  /// Adds a border to the view with the specified style and width.
  Widget border(Border style) =>
      Container(decoration: BoxDecoration(border: style), child: this);
}

extension SwiftTap on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget onTap(GestureTapCallback onTap) =>
      GestureDetector( onTap: onTap, child:this);
}

extension SwiftContainer on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget container({
    Key key,
    AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    Color color,
    Decoration decoration,
    Decoration foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    EdgeInsetsGeometry margin,
    Matrix4 transform,
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
    Key key,
    int flex = 1,
  })
  => Expanded(key:key, flex:flex, child: this,);

}

extension SwiftAspectRatio on Widget {
  Widget aspectRatio(double aspectRatio, {
    Key key,
  })
  => AspectRatio(key:key, aspectRatio:aspectRatio, child: this,);

}

extension SwiftClipRRect on Widget {
  Widget clipRRect({
    Key key,
    BorderRadius borderRadius = BorderRadius.zero,
    CustomClipper<RRect> clipper,
    Clip clipBehavior = Clip.antiAlias,
  })
  => ClipRRect(key:key, borderRadius:borderRadius, clipper:clipper, clipBehavior:clipBehavior, child: this,);
}

extension v on Widget {
  Widget visible(bool visible,{
    Key key,
  })
  => Visibility(key:key, visible: visible, child: this,);

  Widget center({
    Key key,
  })
  => Center(key:key, child: this,);

  Widget safeArea({
    Key key,
  })
  => SafeArea(key:key, child: this,);

  Widget scrollbar({
    Key key,
    ScrollController controller,
    bool isAlwaysShown = false,
    double thickness,
    Radius radius,
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
    Key key
  })
  => SingleChildScrollView(key:key, child: this,);
}


Text ColorText(String data, Color color){
  return Text(data, style: TextStyle(color: color),);
}

