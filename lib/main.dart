import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/_view.dart' as view;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider<model.UserModel>(
                    create: (_) => model.UserModel(id: '', pw: ''),
                ),
                ChangeNotifierProxyProvider<model.UserModel, vm.LoginViewModel>(
                    create: (context) => vm.LoginViewModel(
                        context.read<model.UserModel>()
                    ),
                    update: (context, userModel, previous) =>
                        previous!..updateUserModel(userModel),
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
            },
        );
    }

}