class UserModel{
  late String name;
  late String email;
  late String date;
  late String uId;
  late String status;




  UserModel({
    required this.email,
    required this.date,
    required this.name,
    required this.uId,
    required this.status,


});



  UserModel.fromJson(Map<String , dynamic>  json)
  {
    name = json['name'];
    email = json['email'];
    date = json['date'];
    uId = json['uId'];
    status = json ['status'];





  }

  Map<String , dynamic> toMap(){
    return{
      'name':name,
      'email':email,
      'date':date,
      'uId':uId,
      'status':status,


    };
  }
}