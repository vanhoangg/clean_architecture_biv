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
        child: const Text('primaryColor'),
      ),
      ColoredBox(
        color: Theme.of(context).colorScheme.secondary,
        child: const Text('colorScheme.secondary'),
      ),
      ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: const Text('colorScheme.background'),
      ),
      ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Text('scaffoldBackgroundColor'),
      ),
      ColoredBox(
        color: Theme.of(context).cardColor,
        child: const Text('cardColor'),
      ),
      ColoredBox(
        color: Theme.of(context).dividerColor,
        child: const Text('dividerColor'),
      ),
      ColoredBox(
        color: Theme.of(context).focusColor,
        child: const Text('focusColor'),
      ),
      ColoredBox(
        color: Theme.of(context).hoverColor,
        child: const Text('hoverColor'),
      ),
      ColoredBox(
        color: Theme.of(context).highlightColor,
        child: const Text('highlightColor'),
      ),
      ColoredBox(
        color: Theme.of(context).splashColor,
        child: const Text('splashColor'),
      ),
      ColoredBox(
        color: Theme.of(context).unselectedWidgetColor,
        child: const Text('unselectedWidgetColor'),
      ),
      ColoredBox(
        color: Theme.of(context).disabledColor,
        child: const Text('disabledColor'),
      ),
      ColoredBox(
        color: Theme.of(context).secondaryHeaderColor,
        child: const Text('secondaryHeaderColor'),
      ),
      ColoredBox(
        color: Theme.of(context).dialogBackgroundColor,
        child: const Text('dialogBackgroundColor'),
      ),
    ];
    // Log.d Theme
    Log.d(Theme.of(context).primaryTextTheme.displayLarge?.color.toString());
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(F.title),
        // ),
        body: ListView(
      children: [
        Text(
          '.displayLarge',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          '.displayMedium',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          '.displaySmall',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          '.headlineMedium',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          '.headlineSmall',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '.titleLarge',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          '.titleMedium',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '.titleSmall',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          '.bodyLarge',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          '.bodyMedium',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '.bodySmall',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          '.labelLarge',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          '.labelSmall',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        ...List.generate(colorBoxes.length, (index) => colorBoxes[index]),
        changeThemeButton(context),
      ],
    ));
  }

  Center changeThemeButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          _appCubit.changeAppTheme();
        },
        child: Text('CLICK ME NOW ${F.title}',
            style: TextStyle(
              color: Theme.of(context).primaryTextTheme.displayLarge?.color,
              fontSize: 20,
            )),
      ),
    );
  }
}
