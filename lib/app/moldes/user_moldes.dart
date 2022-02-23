
class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;

  UserModel ({
    required this.id,
    required this.name,
    required this.email,
    required this.password
}
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  
}

factory UserModel.fromMap(Map<String, dynamic> map) => UserModel (
  id: map["id"],
   email: map ["email"], 
   name: map ["name"],
   password: map ["password"] , 
  
);
 
}


