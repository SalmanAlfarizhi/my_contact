class UserModel {
  final String email,name,password;
  final int id;


UserModel({
  required this.email,
  required this.name,
  required this.password,
  required this.id
});

factory UserModel.fromJSON(Map parsedJSON){
  return UserModel(
    email:parsedJSON['email'],
    name:parsedJSON['name'],
    password:parsedJSON['password'],
    id:parsedJSON['id']
  );
}
}