import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/shell/views/app_shell.dart';

class TuSolutionApp extends StatelessWidget {
  const TuSolutionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Solution',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}
