import 'package:flutter/material.dart';
import 'package:instagram/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253c);
    final secondaryTextColor = Color(0xff2D4379);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displaySmall: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: primaryTextColor),
          titleMedium: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: secondaryTextColor),
          titleLarge: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 28.0,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 12.0,
              color: secondaryTextColor),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi,Janathan",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore Today',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 90,
                child: ListView.builder(
                    itemCount: stories.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    itemBuilder: (context, index) {
                      final story = stories[index];

                      return Container(
                        margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color(0xff376AED),
                                          Color(0xff49B0E2),
                                          Color(0xff9CECFB),
                                        ]),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                          'assets/img/stories/${story.imageFileName}'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                    'assets/img/icons/${story.iconFileName}',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
