// const String BASE_URL = "http://52.66.141.181";
const String BASE_URL = "https://83a59b397f60.ngrok.io";

class ApiEndpoints {
  static String courses = BASE_URL + "/api/profile/courses";
  static String subjects = BASE_URL + "/api/course/subject/";
  static String chapters = BASE_URL + "/api/course/chapter/";

  static String home = BASE_URL + "/api/course/home";
  static String subscribe = BASE_URL + "/api/subscription/subscribe";
  static String updateDefaultCourse = BASE_URL + "/api/profile/default";
}

const String NO_DEFAULT_COURSE_STATUS_CODE = "426";
