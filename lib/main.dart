import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtoon_explorer/providers/current_screen_provider.dart';
import 'package:webtoon_explorer/providers/webtoon_provider.dart';
import 'package:webtoon_explorer/screens/favorite_screen.dart';
import 'package:webtoon_explorer/screens/home_screen.dart';
import 'package:webtoon_explorer/services/storage_service.dart';
import 'package:webtoon_explorer/widgets/navigation_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().initHive();
  runApp(const WebtoonApp());
}

class WebtoonApp extends StatefulWidget {
  const WebtoonApp({super.key});

  @override
  State<WebtoonApp> createState() => _WebtoonAppState();
}

class _WebtoonAppState extends State<WebtoonApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WebtoonProvider()),
        ChangeNotifierProvider(create: (context) => CurrentScreenProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: const MyBottomNavBar(),
          body: Consumer<CurrentScreenProvider>(
            builder: (context, currentScreenProvider, child) {
              // Get the current screen index from the provider
              final currentScreenIndex = currentScreenProvider.currentScreen;

              // Create a list of screens to display
              final List<Widget> screens = [
                const HomeScreen(),
                const FavoriteScreen(),
              ];

              return screens[
                  currentScreenIndex]; // Display the appropriate screen,
            },
          ),
        ),
      ),
    );
  }
}
