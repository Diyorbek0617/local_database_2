import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_database_2/model/account_model.dart';
import 'package:local_database_2/model/user_model.dart';

class HiveDB{
  var  box=Hive.box("pdp online");

  storeUser(User user)async{
    box.put("user",user.toJson());
  }
  User loadUser() {
    dynamic  user=User.fromJson(box.get("user"));
    return user;
  }
 void removeUser(){
    box.delete("user");
  }

}
class HiveDB_2{
  var box = Hive.box("pdp online");
  storeAccount(Account account)async{
    box.put("account", account.toJson());
  }
  Account loadAccount(){
    dynamic account=Account.fromJson(box.get("account"));
    return account;
  }
  void removeAccount(){
    box.delete("account");
  }
}