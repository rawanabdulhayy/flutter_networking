import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/Presentation/screens/home_screen.dart';
import 'package:networking/logic/now_playing/now_playing_event.dart';

import '../../logic/now_playing/now_playing_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigator.pushReplacement inside Future.delayed directly in the build method or too early in the widget lifecycle. That usually causes “setState() or markNeedsBuild() called during build” errors because navigation happens before the widget tree is ready.
    // ✅ The fix: wrap it in a WidgetsBinding.instance.addPostFrameCallback, so it only executes after the first frame has rendered.
    // WidgetsBinding.instance.addPostFrameCallback ensures you don’t trigger navigation while Flutter is still building the widget tree.

    // Schedule after first frame

    //a new practice: providing the bloc at navigation from the previous screen.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (_) => MultiBlocProvider(
                  // because we are still gonna be having the top rated and the popular movies.
                  providers: [
                    //The now playing bloc.
                    BlocProvider(
                      //I don't need to provide a context name since I am not gonna be using it
                      create: (_) {
                        final bloc = NowPlayingBloc(Dio());
                        //triggering the event handled in the bloc file; to emit such and such.
                        bloc.add(FetchNowPlayingMovies());
                        return bloc;
                      },
                    ),
                  ],
                  child: const HomeScreen(),
                ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset("assets/images/logos_netflix.png")),
    );
  }
}
