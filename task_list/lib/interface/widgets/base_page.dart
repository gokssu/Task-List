import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget childBody;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final ValueKey? pageKey;
  final EdgeInsetsGeometry? padding;
  final bool? resizeToAvoidBottomInset;
  const BasePage({
    super.key,
    required this.childBody,
    this.floatingActionButton,
    this.pageKey,
    this.appBar,
    this.padding,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pageKey,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        child: Container(
          padding: padding,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.background,
          child: childBody,
        ),
      ),
    );
  }
}
