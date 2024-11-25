  class Constants{
    String? getDirection;
    String? findOutMore;
    String? contactUs;
    String? mailUs;
    String? defaultDropdownValue;

    Constants({this.getDirection, this.findOutMore, this.contactUs, this.mailUs, this.defaultDropdownValue});

    Constants.fromJson(Map<String, dynamic> json){
      getDirection=json['getDirection'];
      findOutMore=json['findOutMore'];
      contactUs = json['contactUs'];
      mailUs = json['mailUs'];
      defaultDropdownValue = json['defaultDropdownValue'];
    }

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = <String, dynamic>{};
      data['getDirection'] = getDirection;
      data['findOutMore'] = findOutMore;
      data['contactUs'] = contactUs;
      data['mailUs'] = mailUs;
      data['defaultDropdownValue'] = defaultDropdownValue;
      return data;
    }

    Constants copyWith({String? getDirection, String? findOutMore, String? contactUs, String? mailUs, String? defaultDropdownValue}){
  return Constants(getDirection: getDirection??this.getDirection, findOutMore: findOutMore??this.findOutMore, contactUs: contactUs??this.contactUs, mailUs: mailUs??this.mailUs, defaultDropdownValue: defaultDropdownValue??this.defaultDropdownValue);
    }
  }