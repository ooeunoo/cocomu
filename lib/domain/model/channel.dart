import 'package:zippy/app/utils/assets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zippy/domain/model/category.dart';

enum ChannelType { community, news }

@immutable
class Channel extends Equatable {
  final int? id;
  final String type;
  final String name;
  final String nameKo;
  final String baseUrl;
  final String listViewUrl;
  final String itemViewUrl;
  final String? imageUrl;
  final bool status;
  final List<Category>? categories;

  const Channel(
      {this.id,
      required this.type,
      required this.name,
      required this.nameKo,
      required this.baseUrl,
      required this.listViewUrl,
      required this.itemViewUrl,
      this.imageUrl,
      required this.status,
      this.categories});

  @override
  List<Object> get props {
    return [type, name, nameKo, baseUrl, listViewUrl, itemViewUrl];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'nameKo': nameKo,
        'baseUrl': baseUrl,
        "listViewUrl": listViewUrl,
        "itemViewUrl": itemViewUrl,
        'imageUrl': imageUrl,
        'status': status,
        'categories': categories
      };

  Map<int, Channel> toIdAssign(Map<int, Channel> map) {
    if (id != null) {
      map[id!] = Channel(
          type: type,
          name: name,
          nameKo: nameKo,
          baseUrl: baseUrl,
          listViewUrl: listViewUrl,
          itemViewUrl: itemViewUrl,
          imageUrl: imageUrl,
          status: status);
    }
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
