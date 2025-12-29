import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;


class LoginBackground {
    static const image = DecorationImage(
        image: AssetImage(theme.AppAssets.backgroundPath),
        fit: BoxFit.cover,
    );

    static late final BoxDecoration backgroundDecoration = BoxDecoration(
        image: image,
    );

    static const Color darkOverlayColor = Color(0x80001935);
}

class ServiceLogo {
    static const padding = EdgeInsets.only(bottom: 20);

    static const String serviceLogoText = theme.AppTexts.serviceLogoText;

    static const TextStyle textStyle = TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: theme.AppColors.contentPrimary,
        height: 1.3,
        letterSpacing: 0,
    );
}

class LoginInput {
    static const padding = EdgeInsets.only(bottom: 10);
    static const crossAxisAlignment = CrossAxisAlignment.start;

    static const TextStyle labelStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: theme.AppColors.contentSecondary,
        height: 1.45,
        letterSpacing: -0.0036,
    );

    static InputDecoration inputDecoration = InputDecoration(
        fillColor: theme.AppColors.backgroundSecondary,
        filled: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
        ),
    );

    static const TextStyle inputStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: theme.AppColors.contentTertiary,
        height: 1.45,
        letterSpacing: -0.0036,
    );

    static const Color cursorColor = theme.AppColors.contentTertiary;
}

class LoginButton {
    static const padding = EdgeInsets.only(top: 10);

    static const double width = double.infinity;
    static const double height = 50;

    static const TextStyle textStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: theme.AppColors.contentPrimary,
        height: 1.45,
        letterSpacing: -0.0036,
    );

    static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: theme.AppColors.accentLight,
        foregroundColor: theme.AppColors.contentPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        textStyle: textStyle,
    );
}