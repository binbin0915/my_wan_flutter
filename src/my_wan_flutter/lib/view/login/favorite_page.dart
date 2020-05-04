import 'package:flutter/material.dart';
import 'package:mywanflutter/config/event.dart';
import 'package:mywanflutter/util/apis.dart';
import 'package:mywanflutter/widget/article_item_view.dart';
import 'package:mywanflutter/widget/refreshable_list.dart';


class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
      ),
      body: RefreshableList(
        [Apis.favorite],
        ['datas'],
        [''],
        (item, index) {
          item['collect'] = true;
          return ArticleItemView(
            item,
            isFromFavorite: true,
          );
        },
        listenTypes: [SwitchFavorite],
      ),
    );
  }
}
