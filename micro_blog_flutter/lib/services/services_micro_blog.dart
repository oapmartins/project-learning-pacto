import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'services_micro_blog.g.dart';

@RestApi(baseUrl: "http://localhost:5001/meu-blog-curso/us-central1")
abstract class ServicesMicroBlog {
  factory ServicesMicroBlog(Dio dio, {String baseUrl}) = _ServicesMicroBlog;

  // @GET("/tasks")
  // Future<List<Task>> getTasks();
}
