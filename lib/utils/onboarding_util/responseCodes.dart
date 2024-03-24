class HttpStatusCodes {
  // Error Codes
  static const int INVALID_INPUT_ERROR = 400;
  static const int UNAUTHORIZED_ERROR = 401;
  static const int FORBIDDEN_ERROR = 403;
  static const int NOT_FOUND_ERROR = 404;
  static const int METHOD_NOT_ALLOWED_ERROR = 405;
  static const int REQUEST_TIMEOUT_ERROR = 408;
  static const int CONFLICT_ERROR = 409;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY_ERROR = 502;
  static const int SERVICE_UNAVAILABLE_ERROR = 503;
  static const int GATEWAY_TIMEOUT_ERROR = 504;

  // Success Codes
  static const int OK_SUCCESS = 200;
  static const int CREATED_SUCCESS = 201;
  static const int ACCEPTED_SUCCESS = 202;
  static const int NO_CONTENT_SUCCESS = 204;
}
