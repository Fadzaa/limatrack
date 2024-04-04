class ApiEndPoint {
  static String baseUrl = 'https://limatrack-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Auth
  static String otpVerification = '$baseUrl/otp';
  static String login = '$baseUrlAuth/login-customer';
  static String register = '$baseUrlAuth/register-customer';
  static String logout = '$baseUrl/users/logout';

  //Pedagang
  static String pedagangAll = '$baseUrl/pedagang/show-all';
  static String pedagangById = '$baseUrl/pedagang/show';
}