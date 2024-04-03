class ApiEndPoint {
  static String baseUrl = 'https://limatrack-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  static String otpVerification = '$baseUrl/otp';

  static String login = '$baseUrlAuth/login-customer';
  static String register = '$baseUrlAuth/register-customer';
  static String logout = '$baseUrlAuth/logout';
}