class LoginRequest {
  String email ;
  String password ;
  LoginRequest(this.email,this.password);
  // instead of doing it in domain/repository inside login fun login(email,password);
}