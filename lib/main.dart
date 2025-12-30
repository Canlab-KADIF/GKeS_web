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

                ChangeNotifierProvider<vm.ItemDetailViewModel>(
                    create: (_) => vm.ItemDetailViewModel(
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