import 'package:clean_architecture_biv/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../flavors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> colorBoxes = [
      ColoredBox(
        color: AppTheme.of(context).themeData.color.secondary,
        child: const Text('colorScheme.secondary'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.colorScheme.background,
        child: const Text('colorScheme.background'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.scaffoldBackgroundColor,
        child: const Text('scaffoldBackgroundColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.cardColor,
        child: const Text('cardColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.dividerColor,
        child: const Text('dividerColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.focusColor,
        child: const Text('focusColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.hoverColor,
        child: const Text('hoverColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.highlightColor,
        child: const Text('highlightColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.splashColor,
        child: const Text('splashColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.unselectedWidgetColor,
        child: const Text('unselectedWidgetColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.disabledColor,
        child: const Text('disabledColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.secondaryHeaderColor,
        child: const Text('secondaryHeaderColor'),
      ),
      ColoredBox(
        color: AppTheme.of(context).color.dialogBackgroundColor,
        child: const Text('dialogBackgroundColor'),
      ),
    ];
    // Log.d AppTheme
    Log.d(AppTheme.of(context)
        .color
        .primaryTextTheme
        .displayLarge
        ?.color
        .toString());
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: AppTheme.of(context).color.colorScheme.background,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Text(
                '.displayLarge',
                style: AppTheme.of(context).color.textTheme.displayLarge,
              ),
              Text(
                '.displayMedium',
                style: AppTheme.of(context).color.textTheme.displayMedium,
              ),
              Text(
                '.displaySmall',
                style: AppTheme.of(context).color.textTheme.displaySmall,
              ),
              Text(
                '.headlineMedium',
                style: AppTheme.of(context).color.textTheme.headlineMedium,
              ),
              Text(
                '.headlineSmall',
                style: AppTheme.of(context).color.textTheme.headlineSmall,
              ),
              Text(
                '.titleLarge',
                style: AppTheme.of(context).color.textTheme.titleLarge,
              ),
              Text(
                '.titleMedium',
                style: AppTheme.of(context).color.textTheme.titleMedium,
              ),
              Text(
                '.titleSmall',
                style: AppTheme.of(context).color.textTheme.titleSmall,
              ),
              Text(
                '.bodyLarge',
                style: AppTheme.of(context).color.textTheme.bodyLarge,
              ),
              Text(
                '.bodyMedium',
                style: AppTheme.of(context).color.textTheme.bodyMedium,
              ),
              Text(
                '.bodySmall',
                style: AppTheme.of(context).color.textTheme.bodySmall,
              ),
              Text(
                '.labelLarge',
                style: AppTheme.of(context).color.textTheme.labelLarge,
              ),
              Text(
                '.labelSmall',
                style: AppTheme.of(context).color.textTheme.labelSmall,
              ),
              ...List.generate(colorBoxes.length, (index) => colorBoxes[index]),
              changeThemeButton(context),
            ],
          )),
    );
  }

  Center changeThemeButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            AppTheme.of(context).toggleTheme();
          });
        },
        child: Text('CLICK ME NOW ${F.title}',
            style: TextStyle(
              color: AppTheme.of(context)
                  .color
                  .primaryTextTheme
                  .displayLarge
                  ?.color,
              fontSize: 20,
            )),
      ),
    );
  }
}
