import 'package:equatable/equatable.dart';

class RequestLogin extends Equatable {
  String email;
  String password;

  RequestLogin({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
  
  @override
  List<Object?> get props => [
    email,
    password,
  ];
}