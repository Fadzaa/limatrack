part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const SPLASH_PAGE = _Paths.SPLASH_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const HOME_PAGE = '/home-page';
  static const SPLASH_PAGE = '/';
}