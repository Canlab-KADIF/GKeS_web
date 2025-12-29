import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/styles/widget_styles.dart' as styles;

class ServiceLogoWidget extends StatelessWidget {
    const ServiceLogoWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return Text(
            styles.ServiceLogoWidgetStyle.serviceLogoText,
            style: styles.ServiceLogoWidgetStyle.textStyle,
            textAlign: styles.ServiceLogoWidgetStyle.textAlign,
        );
    }
}

class SearchIconWidget extends StatelessWidget {
    final Function() onSearch;
    const SearchIconWidget({super.key, required this.onSearch});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.SearchIconWidgetStyle.width,

            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                
                child: GestureDetector(
                    onTap: onSearch,
                    child: Image.asset(styles.SearchIconWidgetStyle.searchIconPath),
                ),
            ),
        );
    }
}

class SearchInputWidget extends StatelessWidget {
    final Function() onSearch;
    final Function(String) onChanged;
    const SearchInputWidget({super.key, required this.onChanged, required this.onSearch});

    @override
    Widget build(BuildContext context) {
        return Theme(
            data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                    selectionColor: styles.SearchInputWidgetStyle.selectionColor,
                    cursorColor: styles.SearchInputWidgetStyle.cursorColor,
                ),
            ),
            child: SizedBox(
                width: styles.SearchInputWidgetStyle.width,

                child: TextField(
                    decoration: styles.SearchInputWidgetStyle.searchDecoration,
                    style: styles.SearchInputWidgetStyle.textStyle,
                    onChanged: onChanged,
                    onSubmitted: (_) => onSearch(),
                ),
            )
        );
    }
}

class OrganizationLogo extends StatelessWidget {
    const OrganizationLogo({super.key});

    @override
    Widget build(BuildContext context) {
        return Align(
            alignment: styles.OrganizationLogo.alignment,
            child: Padding(
                padding: styles.OrganizationLogo.padding,
                child: Image.asset(
                    styles.OrganizationLogo.organizationLogoPath,
                    height: styles.OrganizationLogo.height,
                    fit: styles.OrganizationLogo.fit,
                ),
            )
        );
    }
}