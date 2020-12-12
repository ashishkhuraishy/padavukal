import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

import '../../../../../injection_container.dart';
import '../../../../../widgets/error_widget.dart';
import '../../../domain/entity/chapter.dart';
import '../../../domain/entity/video_data.dart';
import '../bloc/video_bloc.dart';
import '../widgets/description.dart';

class VideoPage extends StatelessWidget {
  final Chapter chapter;

  const VideoPage({
    Key key,
    @required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.name),
      ),
      body: VideoItems(chapter: chapter),
    );
  }
}

class VideoItems extends StatefulWidget {
  const VideoItems({
    Key key,
    @required this.chapter,
  }) : super(key: key);

  final Chapter chapter;

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  List<VideoData> videos = [];
  VideoData currentVideo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(subjectRepo: sl())
        ..add(VideoPageStartEvent(chapterID: widget.chapter.id)),
      child: Builder(
        builder: (context) {
          return BlocConsumer<VideoBloc, VideoState>(
            listener: (context, state) {
              if (state is VideoSuccess) {
                setState(() {
                  videos = state.videoDatas;
                });
              }
              if (state is CurrentVideoState) {
                setState(() {
                  currentVideo = state.videoData;
                });
              }
            },
            builder: (context, state) {
              if (state is VideoInProgress) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is VideoFailure) {
                return ErrorsWidget(
                  errors: state.error,
                  retryFn: () => BlocProvider.of<VideoBloc>(context)
                      .add(VideoPageStartEvent(chapterID: widget.chapter.id)),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoPlayer(
                    currentVideo: currentVideo,
                    key: UniqueKey(),
                  ),
                  Description(
                    videoDetials: currentVideo,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => BlocProvider.of<VideoBloc>(context)
                              .add(VideoChangeEvent(videoData: videos[index])),
                          title: Text(videos[index].name),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    Key key,
    @required this.currentVideo,
  }) : super(key: key);

  final VideoData currentVideo;

  @override
  Widget build(BuildContext context) {
    print(currentVideo?.videoUrl);
    if (currentVideo == null || currentVideo.videoUrl.contains('http')) {
      return Container(
        height: 200,
        color: Colors.grey[350],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error),
              SizedBox(
                height: 8,
              ),
              Text('Invalid Video Url')
            ],
          ),
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      children: [
        VimeoPlayer(
          id: currentVideo.videoUrl,
          looping: false,
          autoPlay: true,
          key: UniqueKey(),
        ),
      ],
    );
  }
}
