import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/components.dart' as components;
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/styles/session_styles.dart' as styles;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class CustomAppBar extends StatelessWidget {
    const CustomAppBar({super.key});

    @override
    Widget build(BuildContext context) {
        final search_view_model = Provider.of<vm.SearchViewModel>(context, listen: false);

        return Container(
            width: styles.CustomAppBar.width,
            height: styles.CustomAppBar.height,
            decoration: styles.CustomAppBar.decoration,

            child: Row(
                children: [
                    components.ServiceLogoComponent(),
                    components.SearchComponent(
                        onSearch: () => search_view_model.search(),
                        onChanged: (query) => search_view_model.setSearchQuery(query),
                    ),
                    Expanded(child: widgets.OrganizationLogo(),)
                ]
            ),
        );
    }
}