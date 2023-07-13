class Auth {
  static String? accessToken;
  static String? user_id;
  static String? name;
  static String? username;
  static String? profile_image;

  static void setAuth(
    String token,
    String user_id,
    String name,
    String username,
    String profile_image,
  ) {
    Auth.accessToken = token;
    Auth.user_id = user_id;
    Auth.name = name;
    Auth.username = username;
    Auth.profile_image = profile_image;
  }

  static void resetAuth() {
    Auth.accessToken = null;
    Auth.user_id = null;
    Auth.name = null;
    Auth.username = null;
    Auth.profile_image = null;
  }

  static bool isLoggedIn() {
    return Auth.accessToken != null ? true : false;
  }
}
