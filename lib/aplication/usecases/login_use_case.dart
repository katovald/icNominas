import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:ic_nominas/domain/models/user_model.dart';
import 'package:ic_nominas/domain/repositories/auth_repo.dart';

class LoginUseCase extends CompletableUseCase<LoginUseCaseParams>{
  AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<Stream<Empleado>> buildUseCaseStream(LoginUseCaseParams params) async {
    final StreamController<Empleado> controller = StreamController();
    try{
      await _authRepo.authenticate(email: params._email, password: params._password);
      controller.close();
    }catch (e){
      controller.addError(e);
    }
    return controller.stream;
  }
  
}

class LoginUseCaseParams {
  String _email;
  String _password;

  LoginUseCaseParams(this._email, this._password);
}