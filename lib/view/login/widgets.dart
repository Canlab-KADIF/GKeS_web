import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/login/styles/widget_styles.dart' as styles;

class BackgroundImage extends StatelessWidget {
  const BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: styles.LoginBackground.backgroundDecoration,
    );
  }
}

class DarkOverlay extends StatelessWidget {
  const DarkOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: styles.LoginBackground.darkOverlayColor,
    );
  }
}

class ServiceLogo extends StatelessWidget {
    const ServiceLogo({super.key});

    @override
    Widget build(BuildContext context) {

        return Padding(
            padding: styles.ServiceLogo.padding,
            child: Text(
                styles.ServiceLogo.serviceLogoText,
                style: styles.ServiceLogo.textStyle,
            )
        );
    }
}

class LoginInput extends StatelessWidget {
    final String label;
    final Function(String) onChanged;
    const LoginInput({super.key, required this.label, required this.onChanged});
    
    @override
    Widget build(BuildContext context) {

        return Padding(
            padding: styles.LoginInput.padding,
            child: Column(
                crossAxisAlignment: styles.LoginInput.crossAxisAlignment,
                children: [
                    Text(label, style: styles.LoginInput.labelStyle),
                    TextField(
                        onChanged: onChanged,
                        decoration: styles.LoginInput.inputDecoration,
                        cursorColor: styles.LoginInput.cursorColor,
                        style: styles.LoginInput.inputStyle,
                    ),
                ],
            )
        );
    }
}

class LoginButton extends StatelessWidget {
    final Function() onPressed;
    final bool isLoading;
    const LoginButton({super.key, required this.onPressed, required this.isLoading});
    
    @override
    Widget build(BuildContext context) {

        return Padding(
            padding: styles.LoginButton.padding,
            child: Container(
                width: styles.LoginButton.width,
                height: styles.LoginButton.height,
                child: ElevatedButton(
                    style: styles.LoginButton.elevatedButtonStyle,
                    onPressed: onPressed,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                ),
            )
        );
    }
}