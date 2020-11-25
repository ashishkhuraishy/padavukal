import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:padavukal/features/course/presentation/courses/screens/view_all_courses.dart';
import 'package:padavukal/features/course/presentation/subjects/bloc/subject_bloc.dart';

class AccountPage extends StatelessWidget {
  static const routeName = "profile";
  @override
  Widget build(BuildContext context) {
    // User currentUser =
    //     Provider.of<UserProvider>(context, listen: false).currentUser;

    var user = BlocProvider.of<AuthBloc>(context).authRepo.getCurrentUser();

    return Scaffold(
      // appBar: AppBar(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    "assets/images/onboardtop.png",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  Positioned(
                      left: 50,
                      right: 50,
                      top: 50,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Icon(
                              MdiIcons.account,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010),
                          Text(
                            // currentUser.name, //* have to change
                            user.displayName,
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      )),
                ],
              ),
              Info(
                  icon: MdiIcons.phone,
                  title: user.phoneNumber ?? 'Not provided'),
              Info(icon: MdiIcons.email, title: user.email ?? 'not provided'),
              // currentUser.email
              // Info(
              //   icon: MdiIcons.syncIcon,
              //   title: "Change Course",
              //   onPressed: () =>
              //       Navigator.of(context).pushNamed(CourseScreen.routeName),
              // ),
              Info(
                icon: MdiIcons.syncIcon,
                title: "Get Premium Package",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAllCourses(
                      subjectBloc: BlocProvider.of<SubjectBloc>(context),
                    ),
                  ),
                ),
              ),
              Info(icon: MdiIcons.messageAlert, title: "Terms and Conditions"),
              Info(
                icon: MdiIcons.information,
                title: "About us",
                onPressed: () => print('About us'),
                // Navigator.of(context).pushNamed(AboutUs.routeName),
              ),
              Info(icon: MdiIcons.phoneDial, title: "Contact us"),
              Info(icon: MdiIcons.hand, title: "Help"),
              Info(
                icon: MdiIcons.redo,
                title: "Sign out",
                onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                  LogOutEvent(),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}

class Info extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  Info({
    this.icon,
    this.onPressed,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: onPressed,
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Profile"),
//       centerTitle: true,
//     ),
//     body: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [

//         Text(
//           BlocProvider.of<AuthBloc>(context)
//               .authRepo
//               .getCurrentUser()
//               .displayName,
//         ),
//         Center(
//           child: RaisedButton.icon(
//             onPressed: () =>
//                 BlocProvider.of<AuthBloc>(context).add(LogOutEvent()),
//             icon: Icon(Icons.logout),
//             label: Text("Log Out"),
//           ),
//         ),
//       ],
//     ),
//   );
// }
