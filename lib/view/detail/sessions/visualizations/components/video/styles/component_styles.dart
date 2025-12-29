import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class VideoComponentStyle {
    static const EdgeInsets padding = EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 20);
}

class ChewieProgressColorsStyle {
    static final ChewieProgressColors progressColors = ChewieProgressColors(
        handleColor: theme.AppColors.backgroundTertiary,
        playedColor: theme.AppColors.backgroundTertiary,
        bufferedColor: theme.AppColors.contentPrimary.withOpacity(0.25),
        backgroundColor: theme.AppColors.backgroundPrimary.withOpacity(0.5),
    );
}