const String BASE_URL = "http://52.66.141.181";
// const String BASE_URL = "http://df007af9437c.ngrok.io";

class ApiEndpoints {
  static String courses = BASE_URL + "/api/profile/courses";
  static String subjects = BASE_URL + "/api/course/subject/";
  static String chapters = BASE_URL + "/api/course/chapter/";

  static String home = BASE_URL + "/api/course/home";
  static String subscribe = BASE_URL + "/api/subscription/subscribe";
  static String updateDefaultCourse = BASE_URL + "/api/profile/default";

  static String getChapters =
      BASE_URL + "/api/course/list_chapter/?subject_id=";

  static String getVideos = BASE_URL + "/api/course/list_video/?chapter_id=";
  static String listExams = BASE_URL + "/api/exam/lis_exams/?chapter_id=";
  static String listQuestions = BASE_URL + "/api/exam/lis_questions/?exam_id=";
}

const String NO_DEFAULT_COURSE_STATUS_CODE = "426";
