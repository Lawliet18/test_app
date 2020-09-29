class Photos {
  String id;
  String altDescription;
  Urls urls;
  Sponsorship sponsorship;
  Sponsor user;

  Photos({this.id, this.altDescription, this.urls});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    sponsorship = json['sponsorship'] != null
        ? new Sponsorship.fromJson(json['sponsorship'])
        : null;
    user = json['user'] != null ? new Sponsor.fromJson(json['user']) : null;
  }
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }
}

class Sponsorship {
  Sponsor sponsor;

  Sponsorship({this.sponsor});

  Sponsorship.fromJson(Map<String, dynamic> json) {
    sponsor =
        json['sponsor'] != null ? new Sponsor.fromJson(json['sponsor']) : null;
  }
}

class Sponsor {
  String id;
  String username;
  String name;

  Sponsor({
    this.id,
    this.username,
    this.name,
  });

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
  }
}
