import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class Response{
  @JsonKey(name:"total")
  String? total;
  @JsonKey(name:"list")
  List<Article>? artDetail;
  Response({
    this.total,this.artDetail
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

      Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Article{
  @JsonKey(name:"id")
  String? id;
  @JsonKey(name:"short_desc")
  String? desc;
  @JsonKey(name:"vendor")
  String? vendor;
  @JsonKey(name:"type")
  String? type;
  @JsonKey(name:"image")
  String? image;
  Article({
    this.id,this.desc,this.vendor,this.type,this.image
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

      Map<String, dynamic> toJson() => _$ArticleToJson(this);
}