import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/_view.dart' as view;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

// MultiProvider(
//   providers: [
//     ChangeNotifierProvider(create: (_) => UserModel()),
//     ChangeNotifierProxyProvider<UserModel, LoginViewModel>(
//       create: (context) => LoginViewModel(context.read<UserModel>()),
//       update: (context, userModel, previous) => LoginViewModel(userModel),
//     ),
//     ChangeNotifierProxyProvider<UserModel, HomeViewModel>(
//       create: (context) => HomeViewModel(context.read<UserModel>()),
//       update: (context, userModel, previous) => HomeViewModel(userModel),
//     ),
//   ],
//   child: MyApp(),
// );


void main() {
    runApp(
        ChangeNotifierProvider(
            create: (_) => vm.LoginViewModel(),
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