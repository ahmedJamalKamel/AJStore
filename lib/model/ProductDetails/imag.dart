class Images {
 late int id;
 late int objectId;
 late String url;
 late String imageUrl;



  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

}