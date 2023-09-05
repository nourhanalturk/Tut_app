
 import 'dart:async';

import 'package:tut_app/domain/usecase/login_usecase.dart';
import 'package:tut_app/presentation/base/baseviewmodel.dart';
import 'package:tut_app/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs {

  LoginObject loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase ;
  LoginViewModel(this._loginUseCase);
  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast(); //.broadcast" to make more than one listener "
  final StreamController _areAllInputsValidStreamController = StreamController<void>.broadcast();

  //inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  login()async {
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold((left) => {
          //left -> return (failure)
    }, (data) => {
          //right ->return (success)
    });
    // response from data layer (AuthenticationResponse)by mapper convert it to (Authentication obj)then the to domain into  model in domain layer then usecase making the request then to presentation
  }

  @override
  setPassword(String password) {
  inputPassword.add(password);
  loginObject=loginObject.copyWith(password: password); //insure that the last updated is here
  inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
  inputUserName.add(userName);
  loginObject=loginObject.copyWith(userName: userName);
  inputAreAllInputsValid.add(null);
  }

  //outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid =>  _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }
  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }
  bool _areAllInputsValid(){
    return _isPasswordValid(loginObject.password)&&_isUserNameValid(loginObject.userName);
  }

}

mixin LoginViewModelInputs {
  setUserName(String userName) ;
  setPassword(String password) ;
  login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;

}
mixin LoginViewModelOutputs{
  Stream<bool> get outIsUserNameValid ;
  Stream<bool> get outIsPasswordValid ;
  Stream<bool> get outAreAllInputsValid ;

}