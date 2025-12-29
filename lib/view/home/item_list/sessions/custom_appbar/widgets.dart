import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/custom_appbar/styles/widget_styles.dart' as styles;

class ServiceLogo extends StatelessWidget {
    const ServiceLogo({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.ServiceLogo.width,
            child: Padding(
                padding: styles.ServiceLogo.padding,
                child: Text(
                    styles.ServiceLogo.serviceLogoText,
                    style: styles.ServiceLogo.textStyle,
                    textAlign: styles.ServiceLogo.textAlign,
                ),
            ),
        );
        
    }
}

class SearchIcon extends StatelessWidget {
    const SearchIcon({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.SearchIcon.width,
            height: styles.SearchCommon.height,
            color: styles.SearchCommon.color,
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {print("searchIcon");},
                    child: Image.asset(styles.SearchIcon.searchIconPath),
                ),
            ),
        );
    }
}

class SearchBar extends StatelessWidget {
    const SearchBar({super.key});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.SearchCommon.padding,
            child: SizedBox(
                width: styles.SearchBar.width,
                height: styles.SearchCommon.height,
                child: TextField(
                    decoration: styles.SearchBar.searchDecoration
                ),
            ),
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