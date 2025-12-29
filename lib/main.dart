import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/_view.dart' as view;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/service/_service.dart' as service;

void main() {
    final authService = service.AuthService();
    final itemService = service.ItemService();
    final filterService = service.FilterService();
    final downloadService = service.DownloadService();
    final packageDownloadService = service.PackageDownloadService();
    final jsonService = service.JsonService();

    runApp(
        MultiProvider(
            providers: [
                // service
                Provider<service.IAuthService>(
                    create: (_) => authService,
                ),
                Provider<service.IItemService>(
                    create: (_) => itemService,
                ),
                Provider<service.IFilterService>(
                    create: (_) => filterService,
                ),
                Provider<service.IDownloadService>(
                    create: (_) => downloadService,
                ),
                Provider<service.IPackageDownloadService>(
                    create: (_) => packageDownloadService,
                ),
                Provider<service.IJsonService>(
                    create: (_) => jsonService,
                ),

                // viewmodel
                ChangeNotifierProvider<vm.UserViewModel>(
                    create: (_) => vm.UserViewModel()
                ),

                ChangeNotifierProvider<vm.LoginViewModel>(
                    create: (context) => vm.LoginViewModel(
                        context.read<vm.UserViewModel>(),
                        context.read<service.IAuthService>(),
                    )
                ),

                ChangeNotifierProvider<vm.ItemLoadViewModel>(
                    create: (context) => vm.ItemLoadViewModel(
                        context.read<service.IItemService>(),
                    ),
                ),

                ChangeNotifierProvider<vm.FilterLoadViewModel>(
                    create: (context) => vm.FilterLoadViewModel(
                        context.read<service.IFilterService>(),
                    ),
                ),
                
                ChangeNotifierProvider<vm.ItemListViewModel>(
                    create: (context) => vm.ItemListViewModel(
                        context.read<vm.ItemLoadViewModel>(),
                        context.read<vm.FilterLoadViewModel>(),
                    ),
                ),

                ChangeNotifierProvider<vm.SearchViewModel>(
                    create: (context) => vm.SearchViewModel(
                        context.read<vm.ItemLoadViewModel>(),
                    ),
                ),

                ChangeNotifierProvider<vm.PageViewModel>(
                    create: (context) => vm.PageViewModel(
                        context.read<vm.ItemLoadViewModel>(),
                    ),
                ),

                ChangeNotifierProvider<vm.FilterViewModel>(
                    create: (context) => vm.FilterViewModel(
                        context.read<vm.FilterLoadViewModel>(),
                        context.read<vm.ItemLoadViewModel>(),
                    ),
                ),

                ChangeNotifierProvider<vm.ItemDetailTitleViewModel>(
                    create: (_) => vm.ItemDetailTitleViewModel(),
                ),

                ChangeNotifierProvider<vm.ItemDetailVideoViewModel>(
                    create: (_) => vm.ItemDetailVideoViewModel(),
                ),

                ChangeNotifierProvider<vm.ItemDetailInfoViewModel>(
                    create: (context) => vm.ItemDetailInfoViewModel(
                        context.read<vm.FilterLoadViewModel>(),
                    ),
                ),

                ChangeNotifierProvider<vm.ItemDetailLogHeaderViewModel>(
                    create: (context) => vm.ItemDetailLogHeaderViewModel(
                        context.read<service.IJsonService>(),
                    ),
                ),

                ChangeNotifierProvider<vm.ItemDetailCauseViewModel>(
                    create: (context) => vm.ItemDetailCauseViewModel(
                        context.read<service.IJsonService>(),
                    ),
                ),

                ChangeNotifierProvider<vm.ItemDetailMapViewModel>(
                    create: (context) => vm.ItemDetailMapViewModel(
                        context.read<service.IJsonService>(),
                        context.read<vm.FilterLoadViewModel>(),
                    ),
                ),

                ChangeNotifierProvider<vm.DownloadViewModel>(
                    create: (context) => vm.DownloadViewModel(
                        context.read<service.IDownloadService>(),
                        context.read<service.IPackageDownloadService>(),
                    ),
                ),

                ChangeNotifierProvider<vm.ItemDetailViewModel>(
                    create: (context) => vm.ItemDetailViewModel(
                        context.read<vm.ItemDetailTitleViewModel>(),
                        context.read<vm.ItemDetailVideoViewModel>(),
                        context.read<vm.ItemDetailInfoViewModel>(),
                        context.read<vm.ItemDetailLogHeaderViewModel>(),
                        context.read<vm.ItemDetailCauseViewModel>(),
                        context.read<vm.ItemDetailMapViewModel>(),
                    ),
                ),

            ],
            child: const App(),
        )

    );
}

class App extends StatelessWidget {
    const App({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: theme.AppTexts.serviceLogoText,
            initialRoute: '/login',
            routes: {
                '/login': (context) => const view.LoginScreen(),
                '/home': (context) => const view.HomeScreen(),
                '/detail': (context) => const view.DetailScreen(),
            },
        );
    }

}