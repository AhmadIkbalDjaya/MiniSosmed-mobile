class Auth {
  static String? accessToken;
  static String? userId;
  static String? name;
  static String? username;
  static String? profile_image;

  static void setAuth(
    String token,
    String userId,
    String name,
    String username,
    String profile_image,
  ) {
    Auth.accessToken = token;
    Auth.userId = userId;
    Auth.name = name;
    Auth.username = username;
    Auth.profile_image = profile_image;
  }

  static void resetAuth() {
    Auth.accessToken = null;
    Auth.userId = null;
    Auth.name = null;
    Auth.username = null;
    Auth.profile_image = null;
  }

  static bool isLoggedIn() {
    return Auth.accessToken != null ? true : false;
  }
}
