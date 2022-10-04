import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/login/components/custom_formfield.dart';
import 'package:suapifba/app/modules/login/stores/login_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginStore = Modular.get<LoginStore>();
  final _formKey = GlobalKey<FormState>();
  late Disposer _disposerLogin;

  String matricula = "";
  String senha = "";

  TextStyle style = const TextStyle(fontFamily: 'Arial', fontSize: 20.0);

  @override
  void initState() {
    super.initState();

    _disposerLogin = loginStore.observer(onState: (state) {
      Modular.to.navigate("/");
    }, onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(loginStore.error.toString()),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposerLogin();
    loginStore.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: 'Login'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 70.0),
                Image.asset(
                  'assets/images/logo-login.png',
                  height: 70.0,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 60.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomFormField(
                      hintText: "Matrícula",
                      onSave: (value) {
                        matricula = value;
                      },
                      validatorMessage: "Por favor, digite sua matrícula.",
                    ),
                    const SizedBox(height: 20.0),
                    CustomFormField(
                      hintText: "Senha",
                      obscureText: true,
                      onSave: (value) {
                        senha = value;
                      },
                      validatorMessage: "Por favor, digite sua senha.",
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.green[400],
                        ),
                        child: ScopedBuilder<LoginStore, Exception, bool>(
                          store: loginStore,
                          onState: (context, state) => Text(
                            'Acessar',
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onLoading: (context) =>
                              const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 2.0,
                          ),
                          onError: (context, error) => Text(
                            'Acessar',
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            loginStore.login(matricula, senha);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
