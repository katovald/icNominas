import 'package:flutter/cupertino.dart';
import 'package:ic_nominas/domain/models/user_model.dart';

abstract class AuthRepo {
  Future<void> register({@required String firstName, @required String lastName, @required String email, @required String password});

  Future<void> authenticate({@required String email, @required String password});

  Future<bool> isAuthenticated();

  Future<Empleado> getCurrentEmployee();

  Future<void> forgottenPass(String email);

  Future<void> logout();
}