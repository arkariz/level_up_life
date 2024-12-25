import 'package:equatable/equatable.dart';

class RequestRegister extends Equatable {
  String email;
  String password;

  RequestRegister({
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