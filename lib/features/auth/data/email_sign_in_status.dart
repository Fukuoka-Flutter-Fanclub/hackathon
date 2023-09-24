enum EmailSignInStatus {
  success('200'),
  badRequestError('400'),
  unauthorizedError('401'),
  alreadyRegisteredError('401'),
  unprocessableEntityError('422'),
  internalServerError('500'),
  unExpectedError(null),
  ;

  const EmailSignInStatus(this.code);

  final String? code;

  EmailSignInStatus from({required String statusCode}) {
    for (final status in EmailSignInStatus.values) {
      if (status.code == statusCode) {
        return status;
      }
    }
    return EmailSignInStatus.unExpectedError;
  }
}
