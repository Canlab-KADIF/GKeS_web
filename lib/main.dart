import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/_view.dart' as view;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/service/_service.dart' as service;

void main() {
    final authService = service.AuthService();
    final itemService = service.ItemService();

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

                // model
                ChangeNotifierProvider<model.UserModel>(
                    create: (_) => model.UserModel(id: '', pw: ''),
                ),

                // viewmodel
                ChangeNotifierProxyProvider2<model.UserModel, service.IAuthService, vm.LoginViewModel>(
                    create: (context) => vm.LoginViewModel(
                        context.read<model.UserModel>(),
                        context.read<service.IAuthService>(),
                    ),
                    update: (context, userModel, authService,previous) =>
                        previous!..updateUserModel(userModel)..updateAuthService(authService),
                ),
                ChangeNotifierProvider<vm.ItemListViewModel>(
                    create: (_) => vm.ItemListViewModel(itemService),
                ),
                ChangeNotifierProvider<vm.ItemDetailViewModel>(
                    create: (_) => vm.ItemDetailViewModel(),
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
            initialRoute: '/home',
            routes: {
                '/login': (context) => const view.LoginScreen(),
                '/home': (context) => const view.ItemListScreen(),
            },
        );
    }

}