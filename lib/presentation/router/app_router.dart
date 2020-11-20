import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BlocExamples/logic/cubit/counter_cubit.dart';
import 'package:BlocExamples/presentation/screens/home_screen.dart';
import 'package:BlocExamples/presentation/screens/second_screen.dart';
import 'package:BlocExamples/presentation/screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      default:
        return null;
    }
  }

  // Route onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case '/':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: _counterCubit,
  //           child: HomeScreen(
  //             title: "Home Screen",
  //             color: Colors.blueAccent,
  //           ),
  //         ),
  //       );
  //     case '/second':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: _counterCubit,
  //           child: SecondScreen(
  //             title: "Second Screen",
  //             color: Colors.redAccent,
  //           ),
  //         ),
  //       );
  //     case '/third':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: _counterCubit,
  //           child: ThirdScreen(
  //             title: "Thirst Screen",
  //             color: Colors.greenAccent,
  //           ),
  //         ),
  //       );
  //     default:
  //       return null;
  //   }
  // }

  // void dispose() {
  //   _counterCubit.close();
  // }
}
