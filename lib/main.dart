import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/services/game_storage_service.dart';
import 'ui/features/game/view_models/game_provider.dart';
import 'ui/features/game/views/home_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  final storageService = GameStorageService();
  await storageService.init();

  runApp(
    ProviderScope(
      overrides: [
        gameStorageServiceProvider.overrideWithValue(storageService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12131C),
        primaryColor: const Color(0xFFFFFFFF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF4FFBDF),
          onPrimary: Color(0xFF12131C),
          secondary: Color(0xFF1E2030),
          onSecondary: Color(0xFFFFFFFF),
          surface: Color(0xFF1E2030),
          onSurface: Color(0xFFFFFFFF),
          onSurfaceVariant: Color(0xFF4A4F6B),
          error: Colors.redAccent,
          onError: Colors.white,
          outline: Color(0xFF4A4F6B),
          outlineVariant: Color(0xFF1E2030),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF12131C),
          foregroundColor: Color(0xFFFFFFFF),
          elevation: 0,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF1E2030),
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xFF1E2030),
          titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18, fontWeight: FontWeight.bold),
          contentTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFF1E2030),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Color(0xFFFFFFFF),
          iconColor: Color(0xFFFFFFFF),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFFFFFFF),
            side: const BorderSide(color: Color(0xFF4A4F6B)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF4FFBDF),
            foregroundColor: const Color(0xFF12131C),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4FFBDF),
            foregroundColor: const Color(0xFF12131C),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFF1E2030),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
