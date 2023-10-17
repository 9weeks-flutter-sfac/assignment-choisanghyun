// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUp {
  String email;
  String password;
  String passwordConfirm;
  String? userName;
  SignUp({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    this.userName,
  });
}
