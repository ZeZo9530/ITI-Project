import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/Success_Stories.dart';

class ApiProvider {
  SuccsessStoriesModel? successStories;

  getSuccessStories() async {
    Response response =
        await Dio().get("http://159.89.4.181:2000/api/v1/success-stories");
    successStories = SuccsessStoriesModel.fromJson(response.data);
    print(successStories?.model![0].id);
    return successStories;
  }

  loginUser({required String email, required String password}) async {
    try {
      // ignore: unused_local_variable
      FormData formData =
          FormData.fromMap({"email": email, "password": password});
      Response response = await (Dio().post(
          "http://159.89.4.181:2000/api/v1/auth/email/signin",
          data: formData));
      print(response.data);
      print(response.data["model"]["tokens"]["accessToken"]);
    } catch (e) {
      if (e is DioException) {
        print(e);
      }
    }
  }
}
