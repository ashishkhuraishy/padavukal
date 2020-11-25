import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/services/pdf_services.dart';
import 'package:padavukal/features/course/domain/entity/video_data.dart';
import 'package:padavukal/styles/styles.dart';

class Description extends StatelessWidget {
  final VideoData videoDetials;

  const Description({Key key, this.videoDetials}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 25, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container(
                  //   color: Colors.blue,
                  //   child: Text(
                  //     "Physics",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 13,
                  //     ),
                  //   ),
                  //   width: deviceSize.width * 0.25,
                  // ),
                  // SizedBox(width: 9),
                  Container(
                    width: deviceSize.width * 0.3,
                    child: Text(
                      "Chapter ${videoDetials?.chapterID}",
                      overflow: TextOverflow.ellipsis,
                      style: chapsubheading,
                    ),
                  ),
                ],
              ),
              FlatButton.icon(
                onPressed: () {
                  PDFService(
                    context: context,
                    url: BASE_URL + videoDetials?.notesUrl,
                  ).showPdf();
                },
                icon: Icon(
                  MdiIcons.noteText,
                  color: Theme.of(context).accentColor,
                ),
                label: Text(
                  "Notes",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
            videoDetials?.name ?? '',
            style: chapheading,
          ),
          SizedBox(height: 6),
          Text(videoDetials?.description ?? ''),
          SizedBox(height: 7),
          // VideoList(subject: subject),
        ],
      ),
    );
  }
}
