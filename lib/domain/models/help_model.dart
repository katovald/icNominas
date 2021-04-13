//in the app yo can send questios, request or even complains,
//this is the model to create the content

class HelpCard {
  String _type;
  String _message;
  String _response;

  get type => _type;
  set type(String value) {
    _type = value;
  }

  get message => _message;
  set message(String value) {
    _message = value;
  }

  get response => _response;
  set response(String value) {
    _response = value;
  }
}