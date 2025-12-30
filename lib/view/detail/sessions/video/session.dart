import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoSession extends StatefulWidget {
    final String? video_path;

    const VideoSession({super.key, this.video_path});

    @override
    State<VideoSession> createState() => _VideoSessionState();
}

class _VideoSessionState extends State<VideoSession> {
    VideoPlayerController? _controller;
    ChewieController? _chewieController;
    Future<void>? _initializeVideoPlayerFuture;

    @override
    void initState() {
        super.initState();

        if (widget.video_path != null) {
            _controller = widget.video_path!.startsWith('http')
                ? VideoPlayerController.networkUrl(Uri.parse(widget.video_path!))
                : VideoPlayerController.file(File(widget.video_path!));

            _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
                _chewieController = ChewieController(
                    videoPlayerController: _controller!,
                    autoPlay: true,
                    looping: true,
                    allowFullScreen: true,
                    allowPlaybackSpeedChanging: true,
                    showControls: true,
                );
                setState(() {});
            });
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
            return const Center(child: Text('No video data'));
        }

        return FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: Chewie(controller: _chewieController!),
                    );
                } else {
                    return const Center(child: CircularProgressIndicator());
                }
            },
        );
    }
}
