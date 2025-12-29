import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/custom_appbar/styles/widget_styles.dart' as styles;

class TitleWidget extends StatelessWidget {
    const TitleWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.TitleStyle.textStyle,

            'Detail View',
        );
    }
}

class DownloadButtonWidget extends StatelessWidget {
    final VoidCallback onPressed;
    const DownloadButtonWidget({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            onPressed: onPressed,
            style: styles.CustomButtonStyle.buttonStyle,
        
            child: Row(
                children: [
                    Container(
                        width: styles.DownloadButtonWidgetIconStyle.size,

                        child: Image.asset(
                            styles.DownloadButtonWidgetIconStyle.path,
                            width: styles.DownloadButtonWidgetIconStyle.size,
                            height: styles.DownloadButtonWidgetIconStyle.size,
                            color: styles.DownloadButtonWidgetIconStyle.color,
                        ),
                    ),

                    SizedBox(width: 15),

                    Text(
                        style: styles.CustomButtonStyle.textStyle,

                        '다운로드',
                    ),
                ],
            ),
        );
    }
}

class LabellingButtonWidget extends StatelessWidget {
    final VoidCallback onPressed;
    const LabellingButtonWidget({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            onPressed: onPressed,
            style: styles.CustomButtonStyle.buttonStyle,

            child: Text(
                style: styles.CustomButtonStyle.textStyle,

                '라벨링 내보내기',
            ),
        );
    }
}

class BackButtonWidget extends StatelessWidget {
    final VoidCallback onPressed;
    const BackButtonWidget({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return IconButton(
            onPressed: onPressed,
            padding: styles.BackButtonWidgetIconStyle.padding,

            icon: Image.asset(
                styles.BackButtonWidgetIconStyle.path,
                width: styles.BackButtonWidgetIconStyle.size,
                height: styles.BackButtonWidgetIconStyle.size,
                color: styles.BackButtonWidgetIconStyle.color,
            ),
        );
    }
}


class DividerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            color: styles.DividerStyle.color,
            height: styles.DividerStyle.height,
        );
    }
}