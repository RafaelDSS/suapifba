import 'dart:convert';

verifyExpToken(String token) {
  var jwt = token.split('.');
  var payload =
      json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
  var expToken = payload['exp'];
  var utcNow = DateTime.now().millisecondsSinceEpoch / 1000;
  return utcNow.toInt() > expToken;
}
