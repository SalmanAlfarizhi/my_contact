class ContactModel {
  final String username,number;
  final int id;


ContactModel({
  required this.username,
  required this.number,
  required this.id
});

factory ContactModel.fromJSON(Map parsedJSON){
  return ContactModel(
    username:parsedJSON['username'],
    number:parsedJSON['number'],
    id:parsedJSON['id']
  );
}
}