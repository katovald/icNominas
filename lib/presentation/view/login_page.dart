import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ic_nominas/domain/repositories/data_auth_repo.dart';
import 'package:ic_nominas/presentation/controller/login_page_controller.dart';
import 'package:ic_nominas/presentation/helpers/constants.dart';

class LoginPage extends View {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPageViewState createState() => LoginPageViewState();
}

class LoginPageViewState extends ViewState<LoginPage, LoginPageController> {
  static const String emailPrompt = 'Correo';
  static const String passwordPrompt = 'Password';
  static const String loginButtonText = 'Inicio';
  static const String forgotPassswordButtonText = '¿Olvidaste la contraseña?';
  static const String registerButtonText = 'Registro';

  final FocusNode _emailFocus;
  final FocusNode _passFocus;

  LoginPageViewState() : _emailFocus = FocusNode(), _passFocus = FocusNode(), super(LoginPageController(DataAuthRepo()));

  @override
  Widget get view {
    return Scaffold(
        key: globalKey,
        body: ProgressHUD(
            child: body,
            indicatorColor: UIConstants.progressBarColor,));
  }

  Stack get body => Stack(
    children: <Widget>[
      background,
      ListView(
        physics: PageScrollPhysics(),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 8,
                          bottom: 10.0),
                      child: Image(
                        image: AssetImage(Resources.logo),
                        width: 200.0,
                      ),
                    ),
                    Text(
                      UIConstants.appName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      emailField,
                      passwordField,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45.0, vertical: 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[forgotPasswordButton],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      loginButton,
                      SizedBox(height: 20.0),
                      registerButton
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  Widget get background => Positioned(
    top: 0.0,
    left: 0.0,
    right: 0.0,
    height: MediaQuery.of(context).size.height,
    child: Image.asset(
      Resources.background,
      fit: BoxFit.cover,
    ),
  );

  // Fields and Buttons

  /// Email input field
  Widget get emailField => EnsureVisibleWhenFocused(
      child: InputField(
        controller.emailTextController,
        emailPrompt,
        _emailFocus,
        type: TextInputType.emailAddress,
      ),
      focusNode: _emailFocus);

  /// Password input field
  Widget get passwordField => EnsureVisibleWhenFocused(
    child: InputField(
        controller.passwordTextController, passwordPrompt, _passFocus,
        isPassword: true),
    focusNode: _passFocus,
  );

  GestureDetector get forgotPasswordButton => GestureDetector(
    onTap: controller.forgotPassword,
    child: Text(
      forgotPassswordButtonText,
      style: new TextStyle(
        color: Color.fromRGBO(230, 38, 39, 0.8),
        fontSize: 14.0,
      ),
    ),
  );

  GestureDetector get loginButton => GestureDetector(
    onTap: () {
      controller.login();
    },
    child: Container(
      width: 320.0,
      height: 50.0,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          color: Color.fromRGBO(230, 38, 39, 1.0),
          borderRadius: BorderRadius.circular(25.0)),
      child: Text(loginButtonText,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.4)),
    ),
  );

  GestureDetector get registerButton => GestureDetector(
    onTap: controller.register,
    child: Text(
      registerButtonText,
      style: TextStyle(
        color: Color.fromRGBO(230, 38, 39, 0.8),
        fontSize: 14.0,
      ),
    ),
  );
}