import 'package:BlocExamples/logic/cubit/counter_cubit.dart';
import 'package:BlocExamples/presentation/router/app_router.dart';
import 'package:BlocExamples/presentation/screens/home_screen.dart';
import 'package:BlocExamples/presentation/screens/second_screen.dart';
import 'package:BlocExamples/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  //final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child:
        //             HomeScreen(color: Colors.blueAccent, title: 'Home Screen'),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: SecondScreen(
        //             color: Colors.redAccent, title: 'Second Screen'),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: ThirdScreen(
        //             color: Colors.greenAccent, title: 'Third Screen'),
        //       ),
        // },
        // home: HomeScreen(
        //   title: 'Bloc Demo',
        //   color: Colors.blueAccent,
        // ),
      ),
    );
  }

  @override
  void dispose() {
    //_appRouter.dispose();
    super.dispose();
  }
}
