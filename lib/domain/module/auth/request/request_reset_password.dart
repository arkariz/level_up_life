import 'package:equatable/equatable.dart';

class RequestResetPassword extends Equatable {
  String email;

  RequestResetPassword({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
  };
  
  @override
  List<Object?> get props => [
    email,
  ];
}