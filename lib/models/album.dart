class Album {
  Results? results;

  Album({this.results});

  Album.fromJson(Map<String, dynamic> json) {
    results = json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  OpensearchQuery? opensearchQuery;
  String? opensearchTotalResults;
  String? opensearchStartIndex;
  String? opensearchItemsPerPage;
  Albummatches? albummatches;
  Attr? attr;

  Results({this.opensearchQuery, this.opensearchTotalResults, this.opensearchStartIndex, this.opensearchItemsPerPage, this.albummatches, this.attr});

  Results.fromJson(Map<String, dynamic> json) {
    opensearchQuery = json['opensearch:Query'] != null ?  OpensearchQuery.fromJson(json['opensearch:Query']) : null;
    opensearchTotalResults = json['opensearch:totalResults'];
    opensearchStartIndex = json['opensearch:startIndex'];
    opensearchItemsPerPage = json['opensearch:itemsPerPage'];
    albummatches = json['albummatches'] != null ?  Albummatches.fromJson(json['albummatches']) : null;
    attr = json['@attr'] != null ?  Attr.fromJson(json['@attr']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (opensearchQuery != null) {
      data['opensearch:Query'] = opensearchQuery!.toJson();
    }
    data['opensearch:totalResults'] = opensearchTotalResults;
    data['opensearch:startIndex'] = opensearchStartIndex;
    data['opensearch:itemsPerPage'] = opensearchItemsPerPage;
    if (albummatches != null) {
      data['albummatches'] = albummatches!.toJson();
    }
    if (attr != null) {
      data['@attr'] = attr!.toJson();
    }
    return data;
  }
}

class OpensearchQuery {
  String? text;
  String? role;
  String? searchTerms;
  String? startPage;

  OpensearchQuery({this.text, this.role, this.searchTerms, this.startPage});

  OpensearchQuery.fromJson(Map<String, dynamic> json) {
    text = json['#text'];
    role = json['role'];
    searchTerms = json['searchTerms'];
    startPage = json['startPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['#text'] = text;
    data['role'] = role;
    data['searchTerms'] = searchTerms;
    data['startPage'] = startPage;
    return data;
  }
}

class Albummatches {
  List<ArtistAlbum>? album;

  Albummatches({this.album});

  Albummatches.fromJson(Map<String, dynamic> json) {
    if (json['album'] != null) {
      album =  <ArtistAlbum>[];
      json['album'].forEach((v) { album!.add( ArtistAlbum.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (album != null) {
      data['album'] = album!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArtistAlbum {
  String? name;
  String? artist;
  String? url;
  List<MusicImage>? image;
  String? streamable;
  String? mbid;

  ArtistAlbum({this.name, this.artist, this.url, this.image, this.streamable, this.mbid});

  ArtistAlbum.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    artist = json['artist'];
    url = json['url'];
    if (json['image'] != null) {
      image =  <MusicImage>[];
      json['image'].forEach((v) { image!.add(MusicImage.fromJson(v)); });
    }
    streamable = json['streamable'];
    mbid = json['mbid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['artist'] = artist;
    data['url'] = url;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['streamable'] = streamable;
    data['mbid'] = mbid;
    return data;
  }
}

class MusicImage {
  String? text;
  String? size;

  MusicImage({this.text, this.size});

  MusicImage.fromJson(Map<String, dynamic> json) {
    text = json['#text'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['#text'] = text;
    data['size'] = size;
    return data;
  }
}

class Attr {
  String? belongTo;

  Attr({this.belongTo});

  Attr.fromJson(Map<String, dynamic> json) {
    belongTo = json['belongTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['belongTo'] = belongTo;
    return data;
  }
}
