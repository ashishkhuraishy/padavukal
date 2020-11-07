import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padavukal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';

class HomePage extends StatelessWidget {
  final List<Subject> subjects;

  const HomePage({
    Key key,
    @required this.subjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).authRepo.getCurrentUser();

    return Scaffold(
      body: Column(
        children: [
          Text(
            "Welcome ${user.displayName}",
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subj = subjects[index];
              return ListTile(
                title: Text(subj.name),
                onTap: () => print(subj.id),
              );
            },
          ),
        ],
      ),
    );
  }
}
