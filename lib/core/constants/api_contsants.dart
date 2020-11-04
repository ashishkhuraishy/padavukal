const String BASE_URL = "http://52.66.141.181";

class ApiEndpoints {
  static String courses = BASE_URL + "/api/course/Courses/";
  static String subjects = BASE_URL + "/api/course/Subject/";
  static String chapters = BASE_URL + "/api/course/Chapter/";

  static String home = BASE_URL + "/api/course/Home";
  static String subscribe = BASE_URL + "/api/subscription/Subscribe";
  static String updateDefaultCourse = BASE_URL + "/api/profile/MyCourseUpdate";
}
