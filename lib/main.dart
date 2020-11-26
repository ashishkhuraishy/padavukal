import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/course/presentation/subjects/bloc/subject_bloc.dart';
import 'features/quiz/presentation/bloc/quiz_bloc.dart';
import 'injection_container.dart' as container;
import 'wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await container.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepo: container.sl(),
          ),
        ),
        BlocProvider<SubjectBloc>(
          create: (context) => SubjectBloc(
            subjectRepo: container.sl(),
          ),
        ),
        BlocProvider<QuizBloc>(
          create: (context) => QuizBloc(
            subjectRepo: container.sl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Padavukal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
