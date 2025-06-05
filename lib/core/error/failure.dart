abstract class Failure {
  final String message ;  // show the message incase of failure
  Failure({
    required this.message  ,
});
}



// two types of failure
//Local failure
//Remote failure
// Shared preferences

class LocalDatabaseFailure extends Failure {
  LocalDatabaseFailure({
    required super.message , // inherit from the Failure class that why super
}) ;
}

//Web api failure
class WebApiFailure extends Failure {
  final int statusCode ; // come from the API status code
  WebApiFailure ({
    required super.message ,
    required this.statusCode
}) ;
}