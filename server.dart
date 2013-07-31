import 'dart:io';

/**
 * http://www.dartlang.org/docs/dart-up-and-running/contents/ch03.html
 * Dart lang. uses dart:io library and implements simple server
 */
main() {
  dartHandler(HttpRequest request) {
    if (request.uri.path == '/languages/dart') {
      print('New request');

      request.response.write('Dart is optionally typed');
      String response = '''\n
        {name:"Kim Yeojong", age:31, job:"Android Programmer", skill:["java", "ruby"]}
        ''';
      request.response.write(response);

    } else {
      print("not found");
      request.response.write('Not found');
      request.response.statusCode = HttpStatus.NOT_FOUND;

    }
    request.response.close();
  };

  HttpServer.bind('127.0.0.1', 8888).then((HttpServer server) {
    server.listen((request) { 
      
      print("got request");
      dartHandler(request);
    });
  });
}
