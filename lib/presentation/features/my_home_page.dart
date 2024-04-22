import 'package:clean_architecture_biv/presentation/app/app_bloc/cubit/app_cubit.dart';
import 'package:clean_architecture_biv/shared/util/function/app_log_util.dart';
import 'package:flutter/material.dart';
import '../../di/di.dart';
import '../../flavors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AppCubit _appCubit = di();

  @override
  Widget build(BuildContext context) {
    List<Widget> colorBoxes = [
      ColoredBox(
        color: Theme.of(context).primaryColor,
        child: const Text('Primary Color'),
      ),
      ColoredBox(
        color: Theme.of(context).colorScheme.secondary,
        child: const Text('Accent Color'),
      ),
      ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: const Text('Background Color'),
      ),
      ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Text('Scaffold Background Color'),
      ),
      ColoredBox(
        color: Theme.of(context).cardColor,
        child: const Text('Card Color'),
      ),
      ColoredBox(
        color: Theme.of(context).dividerColor,
        child: const Text('Divider Color'),
      ),
      ColoredBox(
        color: Theme.of(context).focusColor,
        child: const Text('Focus Color'),
      ),
      ColoredBox(
        color: Theme.of(context).hoverColor,
        child: const Text('Hover Color'),
      ),
      ColoredBox(
        color: Theme.of(context).highlightColor,
        child: const Text('Highlight Color'),
      ),
      ColoredBox(
        color: Theme.of(context).splashColor,
        child: const Text('Splash Color'),
      ),
      ColoredBox(
        color: Theme.of(context).unselectedWidgetColor,
        child: const Text('Unselected Widget Color'),
      ),
      ColoredBox(
        color: Theme.of(context).disabledColor,
        child: const Text('Disabled Color'),
      ),
      ColoredBox(
        color: Theme.of(context).secondaryHeaderColor,
        child: const Text('Secondary Header Color'),
      ),
      ColoredBox(
        color: Theme.of(context).dialogBackgroundColor,
        child: const Text('Dialog Background Color'),
      ),
    ];
    // Log.d Theme
    Log.d(Theme.of(context).primaryTextTheme.displayLarge?.color.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(F.title),
        ),
        body: ListView(
          children: [
            Text(
              'Headline1',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Headline2',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Headline3',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'Headline4',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Headline5',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Headline6',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Subtitle1',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Subtitle2',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'BodyText1',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'BodyText2',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Caption',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Button',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'Overline',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Column(
              children: colorBoxes,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _appCubit.changeAppTheme();
                },
                child: Text('CLICK ME NOW ${F.title}',
                    style: TextStyle(
                      color: Theme.of(context)
                          .primaryTextTheme
                          .displayLarge
                          ?.color,
                      fontSize: 20,
                    )),
              ),
            ),
          ],
        ));
  }
}
