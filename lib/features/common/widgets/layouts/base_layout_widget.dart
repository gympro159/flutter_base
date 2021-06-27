import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';

import 'appbar_base_widget.dart';

class BaseLayoutWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> key;
  final Widget bottomNavigationBar;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget floatingActionButton;
  final double borderRadiusContent;
  final Widget body;
  final String title;
  final bool isShowLeading;
  final Function onPop;
  final Widget leading;
  final List<Widget> actions;
  final Widget tabBar;
  final bool centerTitle;
  final bool isTitleHeaderWidget;
  final Widget titleHeaderWidget;
  final double appBarHeight;
  final bool resizeToAvoidBottomInset;
  final bool resizeToAvoidBottomPadding;
  final double marginBottom;
  final bool dontHaveFormField;
  final Drawer endDrawer;
  final bool endDrawerEnableOpenDragGesture;

  BaseLayoutWidget(
      {this.key,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.body,
      this.borderRadiusContent: 20,
      this.title: '',
      this.isShowLeading: true,
      this.onPop,
      this.actions,
      this.leading,
      this.tabBar,
      this.centerTitle,
      this.isTitleHeaderWidget: false,
      this.titleHeaderWidget,
      this.appBarHeight: 70,
      this.resizeToAvoidBottomInset: true,
      this.resizeToAvoidBottomPadding,
      this.marginBottom = 0.0,
      this.dontHaveFormField,
      this.endDrawer,
      this.endDrawerEnableOpenDragGesture});
  @override
  _BaseLayoutWidgetState createState() => _BaseLayoutWidgetState();
}

class _BaseLayoutWidgetState extends State<BaseLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.dontHaveFormField == true
          ? null
          : () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
      onVerticalDragDown: widget.dontHaveFormField == true
          ? null
          : (details) {
              FocusScope.of(context).unfocus();
            },
      child: Scaffold(
        key: widget.key,
        extendBody: true,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        // resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBarBaseWidget(
          leading: widget.leading,
          actions: widget.actions,
          bottom: widget.tabBar,
          centerTitle: widget.centerTitle,
          isTitleHeaderWidget: widget.isTitleHeaderWidget,
          title: widget.title,
          titleHeaderWidget: widget.titleHeaderWidget,
          toolBarHeight: widget.appBarHeight,
          onPop: widget.onPop,
          isShowLeading: widget.isShowLeading,
        ),
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
        endDrawer: widget.endDrawer,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        body: Container(
          margin: EdgeInsets.only(top: widget.marginBottom),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadiusContent),
              topRight: Radius.circular((widget.borderRadiusContent)),
            ),
            child: Container(
              color: Colors.white,
              child: widget.body,
            ),
          ),
        ),
      ),
    );
  }
}
