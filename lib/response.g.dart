// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      total: json['total'] as String?,
      artDetail: (json['list'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'total': instance.total,
      'list': instance.artDetail,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String?,
      desc: json['short_desc'] as String?,
      vendor: json['vendor'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'short_desc': instance.desc,
      'vendor': instance.vendor,
      'type': instance.type,
      'image': instance.image,
    };
