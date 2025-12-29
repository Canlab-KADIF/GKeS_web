import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/video/widgets.dart' as widgets;
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/video/styles/component_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;

class VideoComponent extends StatefulWidget {
    const VideoComponent({super.key});

    @override
    State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
    VideoPlayerController? _controller;
    ChewieController? _chewieController;
    Future<void>? _initializeVideoPlayerFuture;
    bool _isInit = true;

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();

        if (_isInit) {
            final viewModel = Provider.of<vm.ItemDetailVideoViewModel>(context);

            final videoPath = viewModel.video_path;
            if (videoPath != null && videoPath.isNotEmpty) {
                _controller = videoPath.startsWith('http')
                    ? VideoPlayerController.networkUrl(Uri.parse(videoPath))
                    : VideoPlayerController.file(File(videoPath));

                _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
                    _chewieController = ChewieController(
                        videoPlayerController: _controller!,
                        autoPlay: true,
                        looping: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedChanging: true,
                        showControls: true,
                        materialProgressColors: styles.ChewieProgressColorsStyle.progressColors,
                        bufferingBuilder: (context) => common_widgets.LoadingWidget(),
                    );
                    setState(() {}); // Trigger rebuild to show player
                });
            }

            _isInit = false;
        }
    }

    @override
    void dispose() {
        _controller?.dispose();
        _chewieController?.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        if (_controller == null || _chewieController == null) {
            return const widgets.WarnningWidget();
        }

        return Padding(
            padding: styles.VideoComponentStyle.padding,

            child:FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: Chewie(controller: _chewieController!),
                        );
                    } else {
                        return common_widgets.LoadingWidget();
                    }
                },
            )
        );

    }
}
