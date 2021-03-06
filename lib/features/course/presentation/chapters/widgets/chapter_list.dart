import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/api_contsants.dart';
import '../../../../../styles/styles.dart';
import '../../../domain/entity/chapter.dart';
import '../../videos/screens/video_page.dart';

class ChapterList extends StatelessWidget {
  final List<Chapter> chapters;
  const ChapterList({
    Key key,
    @required this.chapters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final chap = chapters[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPage(chapter: chap),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chap.name,
                  style: chapsubheading,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: chap.thumbnail.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: '$BASE_URL${chap.thumbnail}',
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                              child: Container(
                                height: 180,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Expanded(
                              child: Container(
                                child: Icon(Icons.error),
                                height: 250,
                              ),
                            ),
                          )
                        : Image.asset(
                            'assets/images/sets2.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
