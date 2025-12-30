import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class ServiceLogo {
    static const padding = EdgeInsets.only(left: 30);

    static const double width = 420;

    static const String serviceLogoText = theme.AppTexts.serviceLogoText;
    
    static const TextStyle textStyle = TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: theme.AppColors.contentPrimary,
        height: 1.3,
    );

    static const TextAlign textAlign = TextAlign.left;
}

class SearchCommon {
    static const padding = EdgeInsets.only(top: 20, bottom: 20);
    static const Color color = theme.AppColors.backgroundSecondary;
    static const double height = 50;
}

class SearchIcon {
    static const padding = EdgeInsets.all(20);

    static const double width = 40;

    static const Color color = theme.AppColors.contentPrimary;

    static const String searchIconPath = theme.AppAssets.searchIconPath;
}

class SearchBar {
    static const double width = 540;

    static const InputDecoration searchDecoration = InputDecoration(
        filled: true,
        fillColor: SearchCommon.color,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide.none,
        ),
        hintText: theme.AppTexts.searchHintText,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: theme.AppColors.contentTertiary,
        ),
    );
}

class OrganizationLogo {
    static const Alignment alignment = Alignment.centerRight;
    
    static const padding = EdgeInsets.only(left: 0, right: 30);

    static const String organizationLogoPath = theme.AppAssets.organizationLogoPath;

    static const double height = 53;
    static const BoxFit fit = BoxFit.contain;
}