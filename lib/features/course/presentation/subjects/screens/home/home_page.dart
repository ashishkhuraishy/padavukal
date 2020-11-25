import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../styles/styles.dart';
import '../../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../domain/entity/subject.dart';
import '../../../chapters/screens/chapter_page.dart';
import '../../widgets/test_container.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/homeScreen";

  final List<Subject> subjects;

  HomePage({
    Key key,
    @required this.subjects,
  }) : super(key: key);

  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.purple,
  ];

  final String assetPath = "assets/images/";

  final List<String> images = [
    "phy.png",
    "maths.png",
    "chem.png",
    "bio.png",
  ];

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).authRepo.getCurrentUser();
    // Widget _buildIcon(IconData icon, Function onPressed) {
    //   return IconButton(
    //     icon: Icon(icon),
    //     color: Theme.of(context).primaryColor,
    //     onPressed: onPressed,
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(MdiIcons.sortVariant),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     _buildIcon(MdiIcons.sortVariant, () {}),
              //     // Row(children: [
              //     //   _buildIcon(MdiIcons.magnify, () {}),
              //     //   _buildIcon(MdiIcons.bell, () {}),
              //     // ]),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style:
                          Theme.of(context).primaryTextTheme.headline6.copyWith(
                                color: Colors.blue,
                              ),
                    ),
                    Text(
                      "${user.displayName}",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                    SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 4 / 2.2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: subjects.length, //* ITEM COUNT
                      itemBuilder: (ctx, i) {
                        final color = colors[i % colors.length];
                        final iconImg = assetPath + images[i % images.length];
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChaptersPage(
                                bgColor: color,
                                iconImage: iconImg,
                                subject: subjects[i],
                              ),
                            ),
                          ),
                          //* passing data to overview
                          splashColor: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    "${subjects[i].name}",
                                    style: whiteheading2,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Image.asset(
                                    iconImg,
                                  ),
                                  // scale: 7,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 14),
                    TestContainer(),
                    SizedBox(height: 14),
                    // RecentlyViewed()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
