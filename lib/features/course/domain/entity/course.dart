import 'package:flutter/cupertino.dart';

/// [Course] is the public class available for the entity course
///
/// `id` : "Unique id associated with a course"
/// `name`: "The name of the course"
/// `duration`: a timestamp defining how long the user will have accecs to
///             course if subscribed"
/// `price`: "The price of the course as a double"
/// `isPremium`: "Boolean value with info about wheather the course is Premium
///               or Free"
///
class Course {
  final int id;
  final String name;
  final int duration;
  final double price;
  final bool isPremium;

  Course({
    @required this.id,
    @required this.name,
    @required this.duration,
    @required this.price,
    @required this.isPremium,
  });
}
