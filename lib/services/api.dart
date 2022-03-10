import 'dart:convert';

import 'package:http/http.dart';
import 'package:productbox_exe/Models/usermodel.dart';


class Api {
  Future<bool> login(String email) async {
    var api = Uri.parse('https://jsonplaceholder.typicode.com/users');

    try {
      Response response = await get(
        api,
      );
      // print(response.body);
      if (response.statusCode == 200) {
        //JsonString convert into Json
        List<dynamic> data = jsonDecode(response.body.toString());

        //Json List<dynamic> convert into List<UserModel>
        List<UserModel> tempList =
            data.map((e) => UserModel.fromJson(e)).toList();

        //Creating a List of bool after checking email exist or not
        var chk = tempList.map((e) => e.email == email).toList();

        //If any true value exist in Whole list
        bool userFound = chk.contains(true);

        if (userFound) {
          return true;
        } else {
          return false;
        }
        // if(email == )
        print('Login successfully');
      } else {
        print('failed');
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
