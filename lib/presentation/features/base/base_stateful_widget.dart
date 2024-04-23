import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../../../shared/shared.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  Route get route => di();
  String get name => runtimeType.toString();
  WidgetUtil get widgetUtil => di();

  @override
  void initState() {
    Log.d('[$name] initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Log.d('[$name] didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Log.d('[$name] build');
    return Container();
  }

  @override
  void dispose() {
    Log.d('[$name] dispose');
    super.dispose();
  }
}
