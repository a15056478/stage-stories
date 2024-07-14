import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_stories/presentation/bloc/stories/stories_bloc.dart';
import 'package:stage_stories/presentation/bloc/story%20navigator/story_navigator_bloc.dart';
import 'package:stage_stories/firebase_options.dart';
import 'package:stage_stories/domain/di/get_it.dart' as get_it;

import 'presentation/view/home_page.dart';

/// Print data in debug mode
void dPrint(dynamic data) {
  if (kDebugMode) {
    debugPrint(data.toString());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  unawaited(get_it.init());
  Bloc.observer = const AppBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => get_it.getItInstance<StoriesBloc>(),
    ),
    BlocProvider(
      create: (context) => get_it.getItInstance<StoryNavigatorBloc>(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize:
          Size(375, MediaQuery.of(context).size.height > 720 ? 815 : 700),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}

/// Bloc observer to check bloc state changes in flutter
class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) dPrint('👍🏻$change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    dPrint('👍🏻$transition');
  }
}
