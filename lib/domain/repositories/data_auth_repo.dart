import 'package:ic_nominas/domain/helpers/domain_constants.dart';
import 'package:ic_nominas/domain/models/user_model.dart';
import 'package:ic_nominas/domain/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataAuthRepo implements AuthRepo {
  static DataAuthRepo _instance;

  factory DataAuthRepo() => _instance;

  @override
  Future<void> authenticate({String email, String password}) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<void> forgottenPass(String email) {
    // TODO: implement forgottenPass
    throw UnimplementedError();
  }

  @override
  Future<Empleado> getCurrentEmployee() {
    // TODO: implement getCurrentEmployee
    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool isAuthenticated = preferences.getBool(Constants.isAuthenticatedKey);
      return isAuthenticated ?? false;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register({String firstName, String lastName, String email, String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
}