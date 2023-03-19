import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager1/style/style.dart';
import 'package:task_manager1/utility/utility.dart';

var BaseURL = 'https://task.teamrabbil.com/api/v1';
var RequestHeader = {'Content-type': 'application/json'};

Future<bool> LoginRequest(FormValues) async {
  var URL = Uri.parse('${BaseURL}/login');
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL, headers: RequestHeader, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast('Request Sucessful');
    await WriteUserData(ResultBody);
    return true;
  } else {
    ErrorToast('Request Failed');
    return false;
  }
}

Future<bool> RegitrationRequest(FormValues) async {
  var URL = Uri.parse('${BaseURL}/registration');
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL, headers: RequestHeader, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast('Request Sucessful');
    return true;
  } else {
    ErrorToast('Request Failed');
    return false;
  }
}

Future<bool> VerifyEmailRequest(Email) async {
  var URL = Uri.parse('${BaseURL}/RecoverVerifyEmail/{$Email}');

  var response = await http.get(URL, headers: RequestHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    await WriteEmailVerfication(Email);
    SuccessToast('Request Sucessful');
    return true;
  } else {
    ErrorToast('Request Failed');
    return false;
  }
}

Future<bool> VerifyOTPRequest(Email, OTP) async {
  var URL = Uri.parse('${BaseURL}/RecoverVerifyOTP/{$Email}/${OTP}');

  var response = await http.get(URL, headers: RequestHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    await WriteOTPVerfication(OTP);
    SuccessToast('Request Sucessful');
    return true;
  } else {
    ErrorToast('Request Failed');
    return false;
  }
}

Future<bool> SetPasswordRequest(FormValues) async {
  var URL = Uri.parse('${BaseURL}/RecoverResetPass');
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL, headers: RequestHeader, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast('Request Sucessful');
    return true;
  } else {
    ErrorToast('Request Failed');
    return false;
  }
}

Future<List> TaskListRequest(Status) async {
  var URL = Uri.parse("${BaseURL}/listTaskByStatus/${Status}");
  String? token = await ReadUserData('token');
  var RequestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await http.get(URL, headers: RequestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  
  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast('Request Sucessful');
    return ResultBody['data'];
  } else {
    ErrorToast('Request Failed');
    return ResultBody[''];
  }
}





Future<bool> TaskCreateRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/createTask");
  String? token = await ReadUserData('token');
  var RequestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var PostBody = json.decode(FormValues);
  var response = await http.post(URL, headers: RequestHeaderWithToken,body:PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast('Request Sucessful');
    return true;
  } else {
    ErrorToast('Request Failed');
    return false;
  }
}
