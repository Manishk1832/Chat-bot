import 'dart:convert';
import 'dart:io';
import 'package:chat_bot/data/remote/api/urls.dart';
import 'package:http/http.dart' as httpClient;

class ApiHelper{
  Future<dynamic> generateAIMsg({required String url , required String prompt}) async{
    try{
      var mUri = Uri.parse(url);
     var response = await httpClient.post(mUri, body:
          jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content": prompt
              },
            ]
          })
          ,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${Urls.CHAT_COMPLETION_API_KEY}"

      });

     print(response.body.toString());

     if(response.statusCode == 200){


       var mdata = jsonDecode(response.body);
       if(mdata['error']!=null){
         throw(HttpException("Error: ${mdata['error']['message']}"));
       }
       else{
         return mdata;
       }
     }
     else{
       throw(HttpException("Server error: ${response.statusCode}"));
     }


    }catch(e){
      throw(HttpException(e.toString()));

    }

  }

}